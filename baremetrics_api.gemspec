# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baremetrics_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'baremetrics_api'
  spec.version       = BaremetricsAPI::VERSION
  spec.authors       = ['Third Blink Software Inc']
  spec.email         = ['team@thirdblink.com']

  spec.summary       = 'Ruby client library for Baremetrics V1 API'
  spec.description   = 'Provides an easy way to interact with the Baremetrics API in any application.'
  spec.homepage      = 'https://github.com/rewindit/baremetrics_api'
  spec.license       = 'Nonstandard'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'faraday',  '~> 0.9'
  spec.add_dependency 'faraday_middleware', '~> 0.11'
  spec.add_dependency 'httpclient', '~> 2.8'
  spec.add_dependency 'activesupport', '~> 4.2'
end
