require 'baremetrics/configuration'
require 'baremetrics/http'
require 'baremetrics/endpoint/account'
require 'constants'

module Baremetrics
  class Client
    attr_reader :configuration

    def initialize(options = nil)
      @configuration = nil
      append_request_methods_to_class

      return if options.nil?

      @configuration = Configuration.new(options)

      ensure_valid_configuration
    end

    # Configure the API client
    # @yield [Configuration] the configuration
    # @example Basic configuration
    #   Baremetrics.client.configure do |config|
    #     config.api_key = 'test123'
    #     config.response_limit = '30'
    #   end
    def configure
      raise Error::AlreadyConfigured unless @configuration.nil?

      @configuration = Configuration.new
      yield(@configuration)

      ensure_valid_configuration
    end

    # Returns the raw HTTParty connection configured using the current configuration
    def connection
      ensure_valid_configuration
      Baremetrics::HTTP.new(configuration).class
    end

    private

    def ensure_valid_configuration
      if configuration.nil? || !configuration.valid?
        # nil out the configuration so we can reconfigure
        @configuration = nil
        raise Error::MissingConfigurationKeys
      else
        # Lock in the configuration so it can't be changed during app usage
        @configuration.freeze
      end
    end

    # The methods below are responsible for appending methods from the
    # endpoint classes onto the client. This allows for simple interaction
    # with the gem.
    # For example: client.retrieve_account instead of
    # Baremetrics::Endpoint::Account.new(client).retrieve_account

    def append_request_methods_to_class
      Constants::ENDPOINT_CLASSES.each do |endpoint_class|
        endpoint_instance = endpoint_class.new(self)
        create_methods_from_instance(endpoint_instance)
      end
    end

    def create_methods_from_instance(instance)
      instance.public_methods(false).each do |method_name|
        add_method(instance, method_name)
      end
    end

    def add_method(instance, method_name)
      define_singleton_method(method_name) do |*args|
        instance.public_send(method_name, *args)
      end
    end
  end
end
