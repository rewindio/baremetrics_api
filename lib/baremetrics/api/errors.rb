module Baremetrics::API
  module Error
    class MissingConfigurationKeys < StandardError
      def initialize(msg = 'One or more required configuration keys are missing or invalid')
        super
      end
    end

    class AlreadyConfigured < StandardError
      def initialize(msg = 'Client has already been configured')
        super
      end
    end

    class RateLimitExeeded < StandardError
      def initialize(msg = 'You have exeeded your rate limit')
        super
      end
    end
  end
end
