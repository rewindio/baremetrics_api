# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baremetrics_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'baremetrics-api'
  spec.version       = BaremetricsAPI::VERSION
  spec.authors       = ['Third Blink Software Inc']
  spec.email         = ['team@thirdblink.com']

  spec.summary       = 'Ruby client library for Baremetrics V1 API'
  spec.description   = 'Provides an easy way to interact with the Baremetrics API in any application.'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'Nonstandard'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'httpclient'
  spec.add_dependency 'activesupport'
end
