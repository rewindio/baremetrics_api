module Baremetrics
  module Endpoint
    class Users
      PATH = 'users'.freeze

      def initialize(client)
        @client = client
      end

      def list_users
        JSON.parse(list_users_request.body)
      end

      def show_user(id:)
        JSON.parse(show_user_request(id).body)
      end

      private

      def list_users_request
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url PATH
          req.params = query_params
        end
      end

      def show_user_request(id)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url "#{PATH}/#{id}"
          req.params = query_params
        end
      end
    end
  end
end
