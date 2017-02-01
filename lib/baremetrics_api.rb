require 'baremetrics_api/version'
require 'baremetrics_api/client'

module BaremetricsAPI
  def self.client
    @client ||= BaremetricsAPI::Client.new
  end
end
