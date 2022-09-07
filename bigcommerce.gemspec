# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))
require 'bigcommerce/version'

Gem::Specification.new do |s|
  s.name = 'bigcommerce'
  s.version = Bigcommerce::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.0.0'
  s.license = 'MIT'

  s.authors = ['BigCommerce Engineering']
  s.homepage = 'https://github.com/bigcommerce/bigcommerce-api-ruby'
  s.summary = 'Ruby client library for the BigCommerce API'
  s.description = s.summary
  s.metadata['rubygems_mfa_required'] = 'true'

  s.require_paths = ['lib']
  s.files = Dir['README.md', 'lib/**/*', 'bigcommerce.gemspec']

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'bundler-audit', '~> 0.6'
  s.add_development_dependency 'dotenv', '>= 2.0'
  s.add_development_dependency 'pry', '>= 0.12'
  s.add_development_dependency 'rake', '>= 12.0'
  s.add_development_dependency 'rspec', '~> 3.8'
  s.add_development_dependency 'rspec_junit_formatter', '~> 0.4'
  s.add_development_dependency 'rubocop', '~> 1.0'
  s.add_development_dependency 'rubocop-performance', '>= 1.5'
  s.add_development_dependency 'simplecov', '~> 0.15'

  s.add_dependency 'faraday', '~> 1.1.0'
  s.add_dependency 'faraday_middleware', '~> 1.0'
  s.add_dependency 'hashie', '>= 3.4', '~> 4'
  s.add_dependency 'jwt', '>= 1.5.4', '~> 2'
end
