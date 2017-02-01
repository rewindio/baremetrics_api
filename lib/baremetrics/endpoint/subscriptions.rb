module Baremetrics
  module Endpoint
    class Subscriptions
      PATH = 'subscriptions'.freeze

      def initialize(client)
        @client = client
      end

      def list_subscriptions(source_id: nil, customer_oid: nil, page: nil)
        JSON.parse(list_subscriptions_request(source_id, customer_oid, page).body).with_indifferent_access
      end

      def show_subscription(source_id:, oid:)
        JSON.parse(show_subscription_request(source_id, oid).body).with_indifferent_access
      end

      def update_subscription(subscription_oid:, source_id:, subscription_params:)
        JSON.parse(update_subscription_request(subscription_oid, source_id, subscription_params).body).with_indifferent_access
      end

      def cancel_subscription(subscription_oid:, source_id:, canceled_at:)
        JSON.parse(cancel_subscription_request(subscription_oid, source_id, canceled_at).body).with_indifferent_access
      end

      def create_subscription(source_id:, subscription_params:)
        JSON.parse(create_subscription_request(source_id, subscription_params).body).with_indifferent_access
      end

      def delete_subscription(oid:, source_id:)
        JSON.parse(delete_subscription_request(oid, source_id).body).with_indifferent_access
      end

      private

      def list_subscriptions_request(source_id, customer_oid, page)
        query_params = {
          per_page: @client.configuration.response_limit,
          customer_oid: customer_oid
        }

        query_params[:page] = page unless page.nil?

        @client.connection.get do |req|
          req.url source_id.nil? ? PATH : "#{source_id}/#{PATH}"
          req.params = query_params
        end
      end

      def show_subscription_request(source_id, oid)
        @client.connection.get do |req|
          req.url "#{source_id}/#{PATH}/#{oid}"
        end
      end

      def update_subscription_request(subscription_oid, source_id, subscription_params)
        @client.connection.put do |req|
          req.url "#{source_id}/#{PATH}/#{subscription_oid}"
          req.body = subscription_params
        end
      end

      def cancel_subscription_request(subscription_oid, source_id, canceled_at)
        @client.connection.put do |req|
          req.url "#{source_id}/#{PATH}/#{subscription_oid}/cancel"
          req.body = { canceled_at: canceled_at }
        end
      end

      def create_subscription_request(source_id, subscription_params)
        @client.connection.post do |req|
          req.url "#{source_id}/#{PATH}"
          req.body = subscription_params
        end
      end

      def delete_subscription_request(oid, source_id)
        @client.connection.delete "#{source_id}/#{PATH}/#{oid}"
      end
    end
  end
end
