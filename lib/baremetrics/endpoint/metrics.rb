module Baremetrics
  module Endpoint
    class Metrics
      PATH = '/metrics'.freeze

      def initialize(client)
        @client = client
      end

      def show_summary(start_date:, end_date:)
        JSON.parse(show_summary_request(start_date, end_date).body)
      end

      def show_metric(metric:, start_date:, end_date:, compare_to: 30)
        JSON.parse(show_metric_request(metric, start_date, end_date, compare_to).body)
      end

      def show_customers(metric:, start_date:, end_date:)
        JSON.parse(show_customers_request(metric, start_date, end_date).body)
      end

      def show_plan_breakout(metric:, start_date:, end_date:)
        JSON.parse(show_plan_breakout_request(metric, start_date, end_date).body)
      end

      private

      def show_summary_request(start_date, end_date)
        query_params = {
          page: @client.configuration.response_limit,
          start_date: start_date,
          end_date: end_date
        }

        @client.connection.get PATH, query: query_params
      end

      def show_metric_request(metric, start_date, end_date, compare_to)
        query_params = {
          page: @client.configuration.response_limit,
          start_date: start_date,
          end_date: end_date,
          compare_to: compare_to
        }

        @client.connection.get "#{PATH}/#{metric}", query: query_params
      end

      def show_customers_request(metric, start_date, end_date)
        query_params = {
          page: @client.configuration.response_limit,
          start_date: start_date,
          end_date: end_date
        }

        @client.connection.get "#{PATH}/#{metric}/customers", query: query_params
      end

      def show_plan_breakout_request(metric, start_date, end_date)
        query_params = {
          page: @client.configuration.response_limit,
          start_date: start_date,
          end_date: end_date
        }

        @client.connection.get "#{PATH}/#{metric}/plans", query: query_params
      end
    end
  end
end
