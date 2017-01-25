module Baremetrics
  module Endpoint
    class Goals
      PATH = '/goals'.freeze

      def initialize(client)
        @client = client
      end

      def list_goals
        JSON.parse(list_goals_request.body)
      end

      def show_goal(id:)
        JSON.parse(show_goal_request(id).body)
      end

      def create_goal(goal_params:)
        JSON.parse(create_goal_request(goal_params))
      end

      def delete_goal(id:)
        JSON.parse(delete_goal_request(id))
      end

      private

      def list_goals_request
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get PATH, query: query_params
      end

      def show_goal_request(id)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get "#{PATH}/#{id}", query: query_params
      end

      def create_goal_request(goal_params)
        @client.connection.post PATH, body: goal_params
      end

      def delete_goal_request(id)
        @client.connection.delete "#{PATH}/#{id}"
      end
    end
  end
end
