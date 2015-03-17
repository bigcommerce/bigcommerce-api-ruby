require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List countries
puts Bigcommerce::Country.all(page: 1)

# Get a country
puts Bigcommerce::Country.find(226)

# Get a count of countries
puts Bigcommerce::Country.count
