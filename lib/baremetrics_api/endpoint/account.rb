module BaremetricsAPI
  module Endpoint
    class Account
      PATH = 'account'.freeze

      def initialize(client)
        @client = client
      end

      def get_account
        JSON.parse(account_request.body).with_indifferent_access
      end

      private

      def account_request
        @client.connection.get do |req|
          req.url PATH
        end
      end
    end
  end
end
