module Baremetrics
  module Endpoint
    class Plans
      PATH = 'plans'.freeze

      def initialize(client)
        @client = client
      end

      def list_plans(source_id: nil, search: nil, page: nil)
        JSON.parse(list_plans_request(source_id, search, page).body).with_indifferent_access
      end

      def show_plan(source_id:, oid:)
        JSON.parse(show_plan_request(source_id, oid).body).with_indifferent_access
      end

      def update_plan(plan_oid:, source_id:, plan_params:)
        JSON.parse(update_plan_request(plan_oid, source_id, plan_params).body).with_indifferent_access
      end

      def create_plan(source_id:, plan_params:)
        JSON.parse(create_plan_request(source_id, plan_params).body).with_indifferent_access
      end

      def delete_plan(oid:, source_id:)
        JSON.parse(delete_plan_request(oid, source_id).body).with_indifferent_access
      end

      private

      def list_plans_request(source_id, search, page)
        query_params = {
          per_page: @client.configuration.response_limit
        }

        query_params[:search] = search unless search.nil?
        query_params[:page] = page unless page.nil?

        @client.connection.get do |req|
          req.url source_id.nil? ? PATH : "#{source_id}/#{PATH}"
          req.params = query_params
        end
      end

      def show_plan_request(source_id, oid)
        @client.connection.get do |req|
          req.url "#{source_id}/#{PATH}/#{oid}"
        end
      end

      def update_plan_request(plan_oid, source_id, plan_params)
        @client.connection.put do |req|
          req.url "#{source_id}/#{PATH}/#{plan_oid}"
          req.body = plan_params
        end
      end

      def create_plan_request(source_id, plan_params)
        @client.connection.post do |req|
          req.url "#{source_id}/#{PATH}"
          req.body = plan_params
        end
      end

      def delete_plan_request(oid, source_id)
        @client.connection.delete "#{source_id}/#{PATH}/#{oid}"
      end
    end
  end
end
