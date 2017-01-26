require 'baremetrics/endpoint/account'
require 'baremetrics/endpoint/annotations'
require 'baremetrics/endpoint/charges'
require 'baremetrics/endpoint/customers'
require 'baremetrics/endpoint/events'
require 'baremetrics/endpoint/goals'
require 'baremetrics/endpoint/metrics'
require 'baremetrics/endpoint/plans'
require 'baremetrics/endpoint/sources'
require 'baremetrics/endpoint/subscriptions'
require 'baremetrics/endpoint/users'

class Constants
  API_HOST = 'https://api.baremetrics.com/v1'.freeze
  SANDBOX_API_HOST = 'https://api-sandbox.baremetrics.com/v1'.freeze
  CONFIG_KEYS = [:api_key, :response_limit, :sandbox, :log_traffic].freeze
  DEFAULT_RESPONSE_LIMIT = 30

  # Endpoints
  ENDPOINT_CLASSES = [Baremetrics::Endpoint::Account, Baremetrics::Endpoint::Annotations, Baremetrics::Endpoint::Charges,
                      Baremetrics::Endpoint::Customers, Baremetrics::Endpoint::Events, Baremetrics::Endpoint::Goals,
                      Baremetrics::Endpoint::Metrics, Baremetrics::Endpoint::Plans, Baremetrics::Endpoint::Sources,
                      Baremetrics::Endpoint::Subscriptions, Baremetrics::Endpoint::Users].freeze
end
