require 'baremetrics/api/errors'

module Faraday
  class RateChecker < Faraday::Middleware
    def initialize(app)
      super(app)
    end

    def call(request_env)
      @app.call(request_env).on_complete do |response_env|
        if response_env[:body].include?('You have exceeded your rate limit')
          raise ::Error::RateLimitExeeded
        end
      end
    end
  end
end
