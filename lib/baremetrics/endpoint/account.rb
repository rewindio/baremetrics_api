require 'json'

module Baremetrics
  module Endpoint
    class Account
      PATH = 'account'.freeze

      def initialize(client)
        @client = client
      end

      def get_account
        JSON.parse(account_request.body)
      end

      private

      def account_request
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url PATH
          req.params = query_params
        end
      end
    end
  end
end
