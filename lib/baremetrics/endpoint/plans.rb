module Baremetrics
  module Endpoint
    class Plans
      PATH = '/plans'.freeze

      def initialize(client)
        @client = client
      end

      def list_plans(source_id:, search: nil)
        JSON.parse(list_plans_request(source_id, search).body)
      end

      def show_plan(source_id:, plan_oid:)
        JSON.parse(show_plan_request(source_id, plan_oid).body)
      end

      def update_plan(plan_oid:, source_id:, plan_params:)
        JSON.parse(update_plan_request(plan_oid, source_id, plan_params))
      end

      def create_plan(source_id:, plan_params:)
        JSON.parse(create_plan_request(source_id, plan_params))
      end

      def delete_plan(plan_oid:, source_id:)
        JSON.parse(delete_plan_request(plan_oid, source_id))
      end

      private

      def list_plans_request(source_id, search = nil)
        query_params = {
          page: @client.configuration.response_limit,
          search: search
        }

        @client.connection.get "/#{source_id}#{PATH}", query: query_params
      end

      def show_plan_request(source_id, plan_oid)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get "/#{source_id}#{PATH}/#{plan_oid}", query: query_params
      end

      def update_plan_request(plan_oid, source_id, plan_params)
        @client.connection.put "/#{source_id}#{PATH}/#{plan_oid}", body: plan_params
      end

      def create_plan_request(source_id, plan_params)
        @client.connection.post "/#{source_id}#{PATH}", body: plan_params
      end

      def delete_plan_request(plan_oid, source_id)
        @client.connection.delete "/#{source_id}#{PATH}/#{plan_oid}"
      end
    end
  end
end
