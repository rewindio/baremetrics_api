module Baremetrics
  module Endpoint
    class Customers
      PATH = 'customers'.freeze

      def initialize(client)
        @client = client
      end

      def list_customers(source_id:, search: nil)
        JSON.parse(list_customers_request(source_id, search).body)
      end

      def show_customer(source_id:, oid:)
        JSON.parse(show_customer_request(source_id, oid).body)
      end

      def list_customer_events(source_id:, oid:)
        JSON.parse(list_customer_events_request(source_id, oid).body)
      end

      def update_customer(customer_oid:, source_id:, customer_params:)
        JSON.parse(update_customer_request(customer_oid, source_id, customer_params).body)
      end

      def create_customer(source_id:, customer_params:)
        JSON.parse(create_customer_request(source_id, customer_params).body)
      end

      def delete_customer(oid:, source_id:)
        JSON.parse(delete_customer_request(oid, source_id).body)
      end

      private

      def list_customers_request(source_id, search)
        query_params = {
          page: @client.configuration.response_limit,
          search: search
        }

        @client.connection.get do |req|
          req.url "#{source_id}/#{PATH}"
          req.params = query_params
        end
      end

      def show_customer_request(source_id, oid)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url "#{source_id}/#{PATH}/#{oid}"
          req.params = query_params
        end
      end

      def list_customer_events_request(source_id, oid)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url "#{source_id}/#{PATH}/#{oid}/events"
          req.params = query_params
        end
      end

      def update_customer_request(customer_oid, source_id, customer_params)
        @client.connection.put do |req|
          req.url "#{source_id}/#{PATH}/#{customer_oid}"
          req.body = customer_params
        end
      end

      def create_customer_request(source_id, customer_params)
        @client.connection.post do |req|
          req.url "#{source_id}/#{PATH}"
          req.body = customer_params
        end
      end

      def delete_customer_request(oid, source_id)
        @client.connection.delete "#{source_id}/#{PATH}/#{oid}"
      end
    end
  end
end
