module Baremetrics
  module Endpoint
    class Annotations
      PATH = '/annotations'.freeze

      def initialize(client)
        @client = client
      end

      def list_annotations
        JSON.parse(list_annotations_request.body)
      end

      def show_annotation(id:)
        JSON.parse(show_annotation_request(id).body)
      end

      def create_annotation(annotation_params:)
        JSON.parse(create_annotation_request(annotation_params))
      end

      def delete_annotation(id:)
        JSON.parse(delete_annotation_request(id))
      end

      private

      def list_annotations_request
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get PATH, query: query_params
      end

      def show_annotation_request(id)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get "#{PATH}/#{id}", query: query_params
      end

      def create_annotation_request(annotation_params)
        @client.connection.post PATH, body: annotation_params
      end

      def delete_annotation_request(id)
        @client.connection.delete "#{PATH}/#{id}"
      end
    end
  end
end
