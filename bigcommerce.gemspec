# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bigcommerce/version', __FILE__)

Gem::Specification.new do |s|
  if RUBY_VERSION < '1.9'
    s.add_dependency('activesupport', '< 4.0')
  else
    s.add_dependency('activesupport')
  end
  s.add_dependency('json')
  s.add_dependency('rest-client')
  if RUBY_VERSION >= '1.9'
    s.add_development_dependency("coveralls")
  end
  s.add_development_dependency("ci_reporter")
  s.add_development_dependency("mocha")
  s.add_development_dependency("rake")
  s.add_development_dependency("rspec", '~> 2.11')
  s.add_development_dependency("vcr")
  s.add_development_dependency("webmock", '1.9')
  s.authors  = ["Mark Rickerby", "Rob Howard", "Saranyan Vigraham", "Sasha Gerrand"]
  s.date     = Time.now.strftime("%Y-%m-%d")
  s.description = "Enables Ruby applications to communicate with the Bigcommerce API V2."
  s.email    = ["mark.rickerby@bigcommerce.com",
                "rob.howard@bigcommerce.com",
                "saranyan.vigraham@bigcommerce.com",
                "sasha.gerrand@bigcommerce.com"]
  s.files = ["LICENSE", "Rakefile", "README.md", "bigcommerce.gemspec"] + Dir['./**/*.rb'] + Dir['./**/*.crt']
  s.has_rdoc = false
  s.homepage = "http://github.com/bigcommerce/bigcommerce-api-ruby"
  s.name     = "bigcommerce"
  s.summary  = "Enables Ruby applications to communicate with the Bigcommerce API"
  s.test_files = Dir.glob('spec/**/*_spec.rb')
  s.version  = Bigcommerce::VERSION
end
