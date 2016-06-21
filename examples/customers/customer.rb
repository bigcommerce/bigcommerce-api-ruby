require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List customers
@customers = Bigcommerce::Customer.all(page: 1)
puts @customers

# Get a customer
puts Bigcommerce::Customer.find(@customers.first.id)

# Get a count of customers
puts Bigcommerce::Customer.count

# Create a customer
@customer = Bigcommerce::Customer.create(
  first_name: 'Karl',
  last_name: 'The Fog',
  email: "#{SecureRandom.hex(5)}@example.com"
)
puts @customer

# Update a customer
puts Bigcommerce::Customer.update(
  @customer.id,
  first_name: 'Karrrl'
)

# Delete a customer
puts Bigcommerce::Customer.destroy(@customer.id)

# Delete all customers
# puts Bigcommerce::Customer.destroy_all
