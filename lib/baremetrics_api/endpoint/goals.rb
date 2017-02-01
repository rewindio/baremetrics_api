module BaremetricsAPI
  module Endpoint
    class Goals
      PATH = 'goals'.freeze

      def initialize(client)
        @client = client
      end

      def list_goals(page: nil)
        JSON.parse(list_goals_request(page).body).with_indifferent_access
      end

      def show_goal(id:)
        JSON.parse(show_goal_request(id).body).with_indifferent_access
      end

      def create_goal(goal_params:)
        JSON.parse(create_goal_request(goal_params).body).with_indifferent_access
      end

      def delete_goal(id:)
        JSON.parse(delete_goal_request(id).body).with_indifferent_access
      end

      private

      def list_goals_request(page)
        query_params = {
          per_page: @client.configuration.response_limit
        }

        query_params[:page] = page unless page.nil?

        @client.connection.get do |req|
          req.url PATH
          req.params = query_params
        end
      end

      def show_goal_request(id)
        @client.connection.get do |req|
          req.url "#{PATH}/#{id}"
        end
      end

      def create_goal_request(goal_params)
        @client.connection.post do |req|
          req.url PATH
          req.body = goal_params
        end
      end

      def delete_goal_request(id)
        @client.connection.delete "#{PATH}/#{id}"
      end
    end
  end
end
