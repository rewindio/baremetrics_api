# Baremetrics

This is a Ruby Gem for the Baremetrics API developed by Rewind.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'baremetrics-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baremetrics-api

## Usage

**Initializing the Client**

This gem uses a client model for communication with the API. You initialize a client first with the desired configuration and then use it for making requests:

```ruby
client = Baremetrics::Client.new(api_key: '1234')

client.list_sources
```

The only required configuration parameter to initialize the client is the API key using this constructor. Unprovided parameters will have their default value set.

You can also initialize the client using a configuration block to have it globally configured:

```ruby
Baremetrics.client.configure do |config|
  config.api_key = '123'
  config.sandbox = false
  config.response_limit = 30
  config.log_traffic = false
end

Baremetrics.client.list_source
```

Note that you must specify all the configuration parameters when using this method as they will not have a default value.

**Configuration Parameters**

`api_key`: String - The Baremetrics API key. Can be sandbox or production.

`sandbox`: Boolean - Whether to use the sandbox or production API endpoint. (Default: false)

`response_limit`: Integer - The amount of items to return per page for GET requests (Default: 30)

`log_traffic`: Boolean - Output a log of requests and responses from the Baremetrics API (Default: false)

**Making Requests**

The gem tries to best match its method names to the name of the corresponding API call in the Baremetrics documentation.
All API calls are available as methods on the client object.
To list which calls are available run: `client.methods`

The arguments required for each endpoint are named keywords. We tried to best match the names of the parameters as described in the Baremetrics API documentation.

An example call would be:

```ruby
client.list_customers(source_id: '123')
```

The response to all calls is raw JSON that is returned from the Baremetrics API.

**Rate Limiting**

The Baremetrics API has a rate limit which refreshes per-hour. When the rate limit is exceeded, this gem will throw the following exception `Error::RateLimitExeeded`.

You should rescue this exception and retry after an hour when the rate limit is refreshed.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rewindit/baremetrics.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
