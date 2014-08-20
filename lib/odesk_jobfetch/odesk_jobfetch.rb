require 'odesk_jobfetch/version'
require 'mechanize'

class OdeskJobfetch
  LOGIN_URL = 'https://www.odesk.com/login'
  SEARCH_URL = 'https://www.odesk.com/jobs'

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

  def fetch
    page = @agent.get(SEARCH_URL)
    # TODO@akolomiychuk: Implement
  end
end
