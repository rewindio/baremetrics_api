module Baremetrics
  class Client
    attr_reader :configuration

    def initialize(options = nil)
      @configuration = nil

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
  end
end
