module Baremetrics::API
  module Endpoint
    class Users
      PATH = 'users'.freeze

      def initialize(client)
        @client = client
      end

      def list_users(page: nil)
        JSON.parse(list_users_request(page).body).with_indifferent_access
      end

      def show_user(id:)
        JSON.parse(show_user_request(id).body).with_indifferent_access
      end

      private

      def list_users_request(page)
        query_params = {
          per_page: @client.configuration.response_limit
        }

        query_params[:page] = page unless page.nil?

        @client.connection.get do |req|
          req.url PATH
          req.params = query_params
        end
      end

      def show_user_request(id)
        @client.connection.get do |req|
          req.url "#{PATH}/#{id}"
        end
      end
    end
  end
end
