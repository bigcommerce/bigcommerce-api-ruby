require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List countries
puts Bigcommerce::State.all(226)

# Get a country
puts Bigcommerce::State.find(226, 10)

# Get a count of countries
puts Bigcommerce::State.count(226)

# Get a count of all states for all countries
puts Bigcommerce::State.count_all
