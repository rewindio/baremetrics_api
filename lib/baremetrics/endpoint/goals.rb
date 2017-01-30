module Baremetrics
  module Endpoint
    class Goals
      PATH = 'goals'.freeze

      def initialize(client)
        @client = client
      end

      def list_goals
        JSON.parse(list_goals_request.body).with_indifferent_access
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

      def list_goals_request
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url PATH
          req.params = query_params
        end
      end

      def show_goal_request(id)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url "#{PATH}/#{id}"
          req.params = query_params
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
