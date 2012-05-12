$:.push File.expand_path("../lib", __FILE__)
require "bigcommerce"

Gem::Specification.new do |s|
  s.name     = "bigcommerce"
  s.version  = BigCommerce::VERSION
  s.date     = Time.now.strftime("%Y-%m-%d")
  s.summary  = "Enables Ruby applications to communicate with the BigCommerce API"
  s.email    = "dev-accounts@bigcommerce.com"
  s.homepage = "http://github.com/bigcommerce/bigcommerce-api-ruby"
  s.description = "Enables Ruby applications to communicate with the BigCommerce API V2 (currently in beta trial)."
  s.has_rdoc = false
  s.authors  = ["BigCommerce"]
  s.files = ["LICENSE", "Rakefile", "README.md", "bigcommerce.gemspec"] + Dir['**/*.rb'] + Dir['**/*.crt']
  s.add_dependency('json')
  s.add_development_dependency("fakeweb")
  s.add_development_dependency("mocha")

end