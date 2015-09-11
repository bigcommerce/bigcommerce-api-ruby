lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bigcommerce/version'

Gem::Specification.new do |s|
  s.name = 'bigcommerce'
  s.version = Bigcommerce::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.3'
  s.license = 'MIT'

  s.authors = ['Patrick Edelman']
  s.homepage = 'https://github.com/bigcommerce/bigcommerce-api-ruby'
  s.summary = 'Ruby client library for the Bigcommerce v2 API'
  s.description = <<-EOF
    Bigcommerce API Ruby client library.
    Allows developer access to the Bigcommerce API, for CLI tools or public apps.
    More info: https://developer.bigcommerce.com
  EOF

  s.require_paths = ['lib']
  s.files = `git ls-files`.split($ORS)
  s.test_files = Dir['spec/**/*.rb']

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'

  s.add_dependency 'faraday'
  s.add_dependency 'faraday_middleware'
  s.add_dependency 'hashie', '>=3.0'
end
