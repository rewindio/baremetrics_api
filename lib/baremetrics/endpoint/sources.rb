module Baremetrics
  module Endpoint
    class Sources
      PATH = 'sources'.freeze

      def initialize(client)
        @client = client
      end

      def list_sources
        JSON.parse(sources_request.body).with_indifferent_access
      end

      private

      def sources_request
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url PATH
          req.params = query_params
        end
      end
    end
  end
end
