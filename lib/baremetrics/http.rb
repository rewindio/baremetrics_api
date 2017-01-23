require 'constants'
require 'httparty'

module Baremetrics
  class HTTP
    include HTTParty

    # TODO: MUST REMOVE
    debug_output $stdout

    def initialize(configuration)
      self.class.base_uri configuration.sandbox ? Constants::SANDBOX_API_HOST : Constants::API_HOST
      self.class.headers 'Authorization' => "Bearer #{configuration.api_key}"
    end
  end
end
