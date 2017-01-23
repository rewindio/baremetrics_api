require 'baremetrics/client'
require 'baremetrics/version'

module Baremetrics
  def self.client
    @client || Baremetrics::Client.new
  end
end
