require 'bigcommerce'
require 'date'
require 'vcr'
require 'webmock/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f }

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<API_USER>') { ENV['API_USER'] }
  c.filter_sensitive_data('<API_PASS>') { ENV['API_PASS'] }
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end