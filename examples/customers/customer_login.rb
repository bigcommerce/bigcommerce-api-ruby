require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.client_secret = ENV['BC_CLIENT_SECRET']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# Get a customer
customer = Bigcommerce::Customer.all(page: 1).first

# Generate token login url
puts customer.login_token
