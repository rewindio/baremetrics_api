require 'spec_helper'

describe BaremetricsAPI::Client do
  it 'initalizes a client with no configuration' do
    expect(BaremetricsAPI::Client.new).to be_instance_of BaremetricsAPI::Client
  end

  it 'connection raises error with no configuration' do
    client = BaremetricsAPI::Client.new

    expect { client.connection }.to raise_error BaremetricsAPI::Error::MissingConfigurationKeys
  end

  it 'cannot be configured once already configured' do
    client = BaremetricsAPI::Client.new(api_key: 'test')

    expect do
      client.configure do |config|
        config.api_key = 'test2'
      end
    end.to raise_error BaremetricsAPI::Error::AlreadyConfigured
  end

  it 'connection is present when configuration is valid' do
    client = BaremetricsAPI::Client.new(api_key: 'test')

    expect(client.connection).to be_present
    expect(client.connection).to be_instance_of Faraday::Connection
  end
end
