module Baremetrics
  module Endpoint
    class Sources
      PATH = '/sources'.freeze

      def initialize(client)
        @client = client
      end

      def list_sources
        JSON.parse(sources_request.body)
      end

      private

      def sources_request
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get PATH, query: query_params
      end
    end
  end
end
