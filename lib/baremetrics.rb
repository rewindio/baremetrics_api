require 'baremetrics/api/client'
require 'baremetrics/version'

module Baremetrics::API
  def self.client
    @client ||= Baremetrics::API::Client.new
  end
end
