module Baremetrics
  module Endpoint
    class Annotations
      PATH = 'annotations'.freeze

      def initialize(client)
        @client = client
      end

      def list_annotations
        JSON.parse(list_annotations_request.body).with_indifferent_access
      end

      def show_annotation(id:)
        JSON.parse(show_annotation_request(id).body).with_indifferent_access
      end

      def create_annotation(annotation_params:)
        JSON.parse(create_annotation_request(annotation_params).body).with_indifferent_access
      end

      def delete_annotation(id:)
        JSON.parse(delete_annotation_request(id).body).with_indifferent_access
      end

      private

      def list_annotations_request
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url PATH
          req.params = query_params
        end
      end

      def show_annotation_request(id)
        query_params = {
          page: @client.configuration.response_limit
        }

        @client.connection.get do |req|
          req.url "#{PATH}/#{id}"
          req.params = query_params
        end
      end

      def create_annotation_request(annotation_params)
        @client.connection.post do |req|
          req.url PATH
          req.body = annotation_params
        end
      end

      def delete_annotation_request(id)
        @client.connection.delete "#{PATH}/#{id}"
      end
    end
  end
end
