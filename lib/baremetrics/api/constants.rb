require 'baremetrics/api/endpoint/account'
require 'baremetrics/api/endpoint/annotations'
require 'baremetrics/api/endpoint/charges'
require 'baremetrics/api/endpoint/customers'
require 'baremetrics/api/endpoint/events'
require 'baremetrics/api/endpoint/goals'
require 'baremetrics/api/endpoint/metrics'
require 'baremetrics/api/endpoint/plans'
require 'baremetrics/api/endpoint/sources'
require 'baremetrics/api/endpoint/subscriptions'
require 'baremetrics/api/endpoint/users'

module Baremetrics::API
  class Constants
    API_HOST = 'https://api.baremetrics.com/v1'.freeze
    SANDBOX_API_HOST = 'https://api-sandbox.baremetrics.com/v1'.freeze
    CONFIG_KEYS = [:api_key, :response_limit, :sandbox, :log_traffic].freeze
    DEFAULT_RESPONSE_LIMIT = 30

    # Endpoints
    ENDPOINT_CLASSES = [Baremetrics::API::Endpoint::Account, Baremetrics::API::Endpoint::Annotations, Baremetrics::API::Endpoint::Charges,
                        Baremetrics::API::Endpoint::Customers, Baremetrics::API::Endpoint::Events, Baremetrics::API::Endpoint::Goals,
                        Baremetrics::API::Endpoint::Metrics, Baremetrics::API::Endpoint::Plans, Baremetrics::API::Endpoint::Sources,
                        Baremetrics::API::Endpoint::Subscriptions, Baremetrics::API::Endpoint::Users].freeze
  end
end
