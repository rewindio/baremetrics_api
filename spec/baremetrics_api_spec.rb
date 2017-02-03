require 'spec_helper'

describe BaremetricsAPI do
  it 'has a version number' do
    expect(BaremetricsAPI::VERSION).not_to be nil
  end

  it 'initalizes a client when none is set' do
    @client = nil
    expect(BaremetricsAPI.client).to be_instance_of BaremetricsAPI::Client
  end

  it 'returns the client after already being set' do
    client = BaremetricsAPI.client

    expect(BaremetricsAPI.client).to eq client
  end
end
