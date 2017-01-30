module Baremetrics
  module Endpoint
    class Events
      PATH = 'events'.freeze

      def initialize(client)
        @client = client
      end

      def list_events(source_id:, live_stream: false)
        JSON.parse(list_events_request(source_id, live_stream).body).with_indifferent_access
      end

      def show_event(source_id:, id:)
        JSON.parse(show_event_request(source_id, id).body).with_indifferent_access
      end

      private

      def list_events_request(source_id, live_stream)
        query_params = {
          page: @client.configuration.response_limit,
          live_stream: live_stream
        }

        @client.connection.get do |req|
          req.url "#{source_id}/#{PATH}"
          req.params = query_params
        end
      end

      def show_event_request(source_id, id)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url "#{source_id}/#{PATH}/#{id}"
          req.params = query_params
        end
      end
    end
  end
end
