lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bigcommerce/version'

Gem::Specification.new do |s|
  s.name = 'bigcommerce'
  s.homepage = 'https://github.com/bigcommerce/bigcommerce-api-ruby'
  s.authors = ['Patrick Edelman']
  s.version = Bigcommerce::VERSION
  s.license = 'MIT'

  s.description = 'Bigcommerce API Ruby client library. Allows developers to \
  easily communicate with the Bigcommerce API, for either CLI tools or public \
  apps. More info: http://developer.bigcommerce.com'
  s.summary = 'Ruby client library for the Bigcommerce v2 API'

  s.required_ruby_version = '>= 1.9.3'
  s.require_paths = ['lib']
  s.files = `git ls-files`.split($ORS)
  s.test_files = Dir['spec/**/*.rb']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'

  s.add_dependency 'faraday'
  s.add_dependency 'faraday_middleware'
  s.add_dependency 'hashie'
end
