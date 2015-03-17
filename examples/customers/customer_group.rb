require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List all customer groups
puts Bigcommerce::CustomerGroup.all

# Get a customer group
puts Bigcommerce::CustomerGroup.find(1)

# Get a count of all customer groups
puts Bigcommerce::CustomerGroup.count

# Create a customer group
@customer_group = Bigcommerce::CustomerGroup.create(
  name: "Customer Group #{SecureRandom.hex}"
)
puts @customer_group

# Update a customer group
puts Bigcommerce::CustomerGroup.update(
  @customer_group.id,
  name: "Customer_group #{SecureRandom.hex}"
)

# Delete a customer group
puts Bigcommerce::CustomerGroup.destroy(@customer_group.id)

# Delete all customer groups
# puts Bigcommerce::CustomerGroup.destroy_all
