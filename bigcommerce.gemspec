# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bigcommerce/version', __FILE__)

Gem::Specification.new do |s|
  s.add_dependency('activesupport')
  s.add_dependency('json')
  s.add_development_dependency("ci_reporter")
  s.add_development_dependency("fakeweb")
  s.add_development_dependency("mocha")
  s.add_development_dependency("rake")
  s.add_development_dependency("rspec", '~> 2.11')
  s.authors  = ["Bigcommerce"]
  s.date     = Time.now.strftime("%Y-%m-%d")
  s.description = "Enables Ruby applications to communicate with the Bigcommerce API V2 (currently in beta trial)."
  s.email    = "dev-accounts@bigcommerce.com"
  s.files = ["LICENSE", "Rakefile", "README.md", "bigcommerce.gemspec"] + Dir['./**/*.rb'] + Dir['./**/*.crt']
  s.has_rdoc = false
  s.homepage = "http://github.com/bigcommerce/bigcommerce-api-ruby"
  s.name     = "bigcommerce"
  s.summary  = "Enables Ruby applications to communicate with the Bigcommerce API"
  s.test_files = Dir.glob('spec/**/*_spec.rb')
  s.version  = Bigcommerce::VERSION
end
