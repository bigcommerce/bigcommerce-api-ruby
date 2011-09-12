Gem::Specification.new do |s|
  s.name     = "bigcommerce"
  s.version  = "0.0.1"
  s.date     = "2011-09-12"
  s.summary  = "Enables Ruby applications to communicate with the BigCommerce API"
  s.email    = "dev-accounts@bigcommerce.com"
  s.homepage = "http://github.com/bigcommerce/bigcommerce-api-ruby"
  s.description = "Enables Ruby applications to communicate with the BigCommerce API"
  s.has_rdoc = false
  s.authors  = ["BigCommerce"]
  s.files = ["LICENSE", "Rakefile", "README.md", "bigcommerce.gemspec"] + Dir['**/*.rb'] + Dir['**/*.crt']
  s.add_dependency('json')
end