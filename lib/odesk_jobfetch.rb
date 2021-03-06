require 'mechanize'
require 'odesk_jobfetch/version'

class OdeskJobfetch
  BASE_URL = 'https://www.odesk.com'
  LOGIN_URL = BASE_URL + '/login'
  SEARCH_URL = BASE_URL + '/jobs'

  def initialize(proxy = {})
    @agent = Mechanize.new
    @agent.set_proxy(proxy[:server], proxy[:port]) unless proxy.empty?
  end

  def authorize(username, password)
    page = @agent.get(LOGIN_URL)
    form = page.form_with(name: 'login')
    form.username, form.password = username, password
    form.submit
  end

  def fetch(params, simple_format = false)
    page = @agent.get(
      SEARCH_URL, params, nil,
      { 'accept' => 'application/json', 'x-requested-with' => 'XMLHttpRequest' }
    )

    if page.response['content-type'] != 'application/json'
      fail 'Forgot to authorize?'
    end

    resp = JSON.parse(page.body)
    jobs = resp['jobs_raw_data']['jobs']
    simple_format ? simple_format(jobs) : jobs
  end

  private

  def simple_format(jobs)
    jobs.map do |j|
      {
        title: j['title'],
        snippet: j['snippet'],
        job_type: j['job_type'],
        budget: j['budget'],
        workload: j['workload'],
        url: j['url'],
        publish_time: Date.parse(j['publish_time'])
      }
    end
  end
end
