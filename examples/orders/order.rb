require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List orders
@orders = Bigcommerce::Order.all
puts @orders

# Get an order
@order = @orders[0]
puts Bigcommerce::Order.find(@order.id)

# Get a count of orders
puts Bigcommerce::Order.count

# Create an order
@order = Bigcommerce::Order.create(
  billing_address: {
    first_name: 'Karl',
    last_name: 'The Fog',
    street_1: '685 Market St.',
    city: 'San Francisco',
    state: 'California',
    zip: '94019',
    country: 'United States',
    email: 'test@example.com'
  },
  products: [
    {
      product_id: 5,
      quantity: 2
    }
  ]
)
puts @order

# Update an order
puts Bigcommerce::Order.update(
  @order.id,
  billing_address: {
    last_name: 'TheFog'
  }
)

# Delete an order
puts Bigcommerce::Order.destroy(@order.id)

# Delete all orders
# puts Bigcommerce::Order.destroy_all
