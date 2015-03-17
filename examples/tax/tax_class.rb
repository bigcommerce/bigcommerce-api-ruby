require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List tax classes
puts Bigcommerce::TaxClass.all

# Get a tax classes
puts Bigcommerce::TaxClass.find(1)
