module Baremetrics
  module Endpoint
    class Charges
      PATH = 'charges'.freeze

      def initialize(client)
        @client = client
      end

      def list_charges(source_id:)
        JSON.parse(list_charges_request(source_id).body).with_indifferent_access
      end

      def show_charge(source_id:, oid:)
        JSON.parse(show_charge_request(source_id, oid).body).with_indifferent_access
      end

      def create_charge(source_id:, charge_params:)
        JSON.parse(create_charge_request(source_id, charge_params).body).with_indifferent_access
      end

      private

      def list_charges_request(source_id)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url "#{source_id}/#{PATH}"
          req.params = query_params
        end
      end

      def show_charge_request(source_id, oid)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url "#{source_id}/#{PATH}/#{oid}"
          req.params = query_params
        end
      end

      def create_charge_request(source_id, charge_params)
        client.connection.post do |req|
          req.url "#{source_id}/#{PATH}"
          req.body = charge_params
        end
      end
    end
  end
end
