module BaremetricsAPI
  module Endpoint
    class Events
      PATH = 'events'.freeze

      def initialize(client)
        @client = client
      end

      def list_events(source_id:, live_stream: false, page: nil)
        JSON.parse(list_events_request(source_id, live_stream, page).body).with_indifferent_access
      end

      def show_event(source_id:, id:)
        JSON.parse(show_event_request(source_id, id).body).with_indifferent_access
      end

      private

      def list_events_request(source_id, live_stream, page)
        query_params = {
          per_page: @client.configuration.response_limit,
          live_stream: live_stream
        }

        query_params[:page] = page unless page.nil?

        @client.connection.get do |req|
          req.url "#{source_id}/#{PATH}"
          req.params = query_params
        end
      end

      def show_event_request(source_id, id)
        @client.connection.get do |req|
          req.url "#{source_id}/#{PATH}/#{id}"
        end
      end
    end
  end
end
