# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))
require 'bigcommerce/version'

Gem::Specification.new do |s|
  s.name = 'bigcommerce'
  s.version = Bigcommerce::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 3.0'
  s.license = 'MIT'

  s.authors = ['BigCommerce Engineering']
  s.homepage = 'https://github.com/bigcommerce/bigcommerce-api-ruby'
  s.summary = 'Ruby client library for the BigCommerce API'
  s.description = s.summary
  s.metadata['rubygems_mfa_required'] = 'true'

  s.require_paths = ['lib']
  s.files = Dir['README.md', 'lib/**/*', 'bigcommerce.gemspec']

  s.add_dependency 'faraday', '~> 2.12'
  s.add_dependency 'faraday-gzip', '~> 3'
  s.add_dependency 'hashie', '>= 3.4', '~> 4'
  s.add_dependency 'jwt', '>= 1.5.4', '~> 2'
end
