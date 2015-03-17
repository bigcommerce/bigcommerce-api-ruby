require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@customer = Bigcommerce::Customer.all[0]

# List a customer address
@customer_addresses = Bigcommerce::CustomerAddress.all(@customer.id)
puts @customer_addresses

# Get a customer address
puts Bigcommerce::CustomerAddress.find(@customer.id, @customer_addresses[0].id)

# Get a count of customer addresses
puts Bigcommerce::CustomerAddress.count(@customer.id)

# Get a count of all customer addresses for all customers
puts Bigcommerce::CustomerAddress.count_all

# Create a customer address
@customer_address = Bigcommerce::CustomerAddress.create(
  @customer.id,
  first_name: 'Foo',
  last_name: 'Bar',
  phone: '5555555555',
  street_1: '685 Market St.',
  city: 'San Francisco',
  state: 'California',
  zip: '94019',
  country: 'United States'
)
puts @customer_address

# Update a customer address
puts Bigcommerce::CustomerAddress.update(
  @customer.id,
  @customer_address.id,
  first_name: 'Foo',
  last_name: 'Bar'
)

# Delete a customer address
puts Bigcommerce::CustomerAddress.destroy(@customer.id, @customer_address.id)

# Delete all customer addresses
# puts Bigcommerce::CustomerAddress.destroy_all(@customer.id)
