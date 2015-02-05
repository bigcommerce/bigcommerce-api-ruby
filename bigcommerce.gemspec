# -*- encoding: utf-8 -*-
# stub: bigcommerce 0.9.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bigcommerce"
  s.version = "0.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Rickerby", "Rob Howard", "Saranyan Vigraham", "Sasha Gerrand"]
  s.date = "2015-01-27"
  s.description = "Enables Ruby applications to communicate with the Bigcommerce API V2."
  s.license = 'MIT'
  s.email = ["mark.rickerby@bigcommerce.com", "rob.howard@bigcommerce.com", "saranyan.vigraham@bigcommerce.com", "sasha.gerrand@bigcommerce.com"]
  s.files = ["LICENSE", "Rakefile", "README.md", "bigcommerce.gemspec", "./lib/big_commerce.rb", "./lib/bigcommerce/api.rb", "./lib/bigcommerce/connection.rb", "./lib/bigcommerce/version.rb", "./lib/bigcommerce/resource.rb", "./lib/bigcommerce/product.rb", "./lib/bigcommerce.rb", "./spec/big_commerce_spec.rb", "./spec/integration/orders_spec.rb", "./spec/spec_helper.rb", "./spec/support/integration_context.rb", "./spec/support/mock_api_context.rb", "./spec/unit/api_request_spec.rb", "./spec/unit/api_spec.rb", "./spec/unit/connection_spec.rb", "./spec/unit/date_time_spec.rb", "./spec/unit/version_spec.rb", "spec/big_commerce_spec.rb", "spec/integration/orders_spec.rb", "spec/unit/api_request_spec.rb", "spec/unit/api_spec.rb", "spec/unit/connection_spec.rb", "spec/unit/date_time_spec.rb", "spec/unit/version_spec.rb"]
  s.homepage = "http://github.com/bigcommerce/bigcommerce-api-ruby"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Enables Ruby applications to communicate with the Bigcommerce API"
  s.test_files = ["spec/big_commerce_spec.rb", "spec/integration/orders_spec.rb", "spec/unit/api_request_spec.rb", "spec/unit/api_spec.rb", "spec/unit/connection_spec.rb", "spec/unit/date_time_spec.rb", "spec/unit/version_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<rest-client>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<ci_reporter_rspec>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.11"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<webmock>, ["= 1.9"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<ci_reporter_rspec>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.11"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<webmock>, ["= 1.9"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<ci_reporter_rspec>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.11"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<webmock>, ["= 1.9"])
  end
end
