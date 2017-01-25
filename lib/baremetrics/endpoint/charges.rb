module Baremetrics
  module Endpoint
    class Charges
      PATH = '/charges'.freeze

      def initialize(client)
        @client = client
      end

      def list_charges(source_id:)
        JSON.parse(list_charges_request(source_id).body)
      end

      def show_charge(source_id:, oid:)
        JSON.parse(show_charge_request(source_id, oid).body)
      end

      def create_charge(source_id:, charge_params:)
        JSON.parse(create_charge_request(source_id, charge_params).body)
      end

      private

      def list_charges_request(source_id)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get "/#{source_id}#{PATH}", query: query_params
      end

      def show_charge_request(source_id, oid)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get "/#{source_id}#{PATH}/#{oid}", query: query_params
      end

      def create_charge_request(source_id, charge_params)
        @client.connection.post "/#{source_id}#{PATH}", body: charge_params
      end
    end
  end
end