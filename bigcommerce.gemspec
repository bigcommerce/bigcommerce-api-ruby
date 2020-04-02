lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
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

  s.require_paths = ['lib']
  s.files = Dir['README.md', 'lib/**/*', 'bigcommerce.gemspec']

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'

  s.add_dependency 'faraday', '~> 0.11'
  s.add_dependency 'faraday_middleware', '~> 0.11'
  s.add_dependency 'hashie', '~> 3.4'
  s.add_dependency 'jwt', '~> 2.1.0'
end
