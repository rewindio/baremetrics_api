require 'spec_helper'

describe BaremetricsAPI::Configuration do
  it 'initializes a configuration' do
    config = BaremetricsAPI::Configuration.new(api_key: 'test')

    expect(config).to be_instance_of(BaremetricsAPI::Configuration)
  end

  it 'has a valid configuration when the required values are set' do
    config = BaremetricsAPI::Configuration.new(api_key: 'test')

    expect(config.valid?).to eq true
  end

  it 'has an invalid configuration when the required values are not set' do
    config = BaremetricsAPI::Configuration.new

    expect(config.valid?).to eq false
  end

  it 'overrides the default value of the configuration when provided' do
    config = BaremetricsAPI::Configuration.new(api_key: 'test', sandbox: true)

    expect(config.sandbox).to eq true
  end
end
