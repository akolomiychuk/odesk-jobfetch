# odesk-jobfetch

Odesk API have a delay for showing new jobs relatively to on-site search.
This small tool fetches jobs using on-site search, so you'll be always the first
who receive notification about new jobs.

## Installation

Add this line to your application's Gemfile:

    gem 'odesk-jobfetch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install odesk-jobfetch

## Usage

```ruby
oj = OdeskJobfetch.new
oj.authorize('username', 'password')
# You can get a query on Odesk search page.
query = { q: 'ruby', sortBy: 's_time+desk', c1: 'Web Development' }
jobs = oj.fetch(query) # You can pass true as second arg to get it in simpler format.
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/odesk-jobfetch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
