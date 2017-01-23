require 'constants'

module Baremetrics
  class Configuration
    CONFIG_KEYS = Constants::CONFIG_KEYS

    attr_accessor *CONFIG_KEYS

    def initialize(configuration = nil)
      return unless configuration.is_a?(Hash)

      configuration.each do |name, value|
        send("#{name}=", value)
      end

      # Default to false
      self.sandbox = false if sandbox.nil?
      self.response_limit = Constants::DEFAULT_RESPONSE_LIMIT
    end

    def keys
      CONFIG_KEYS.each_with_object({}) do |return_hash, key|
        return_hash[key] = send(key)
        return_hash
      end
    end

    # A configuration is valid if none of the keys are nil
    def valid?
      CONFIG_KEYS.none? { |key| send(key).nil? }
    end
  end
end
