require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@order = Bigcommerce::Order.all[0]

# List order shipping address
@order_shipping_addresses = Bigcommerce::OrderShippingAddress.all(@order.id)
puts @order_shipping_addresses

# Get an order shipping address
@order_shipping_address = @order_shipping_addresses[0]
puts Bigcommerce::OrderShippingAddress.find(@order.id, @order_shipping_address.id)

# Get a count of order shipping addresses
puts Bigcommerce::OrderShippingAddress.count(@order.id)

# Get a count of all order shipping addresses for all order
puts Bigcommerce::OrderShippingAddress.count_all
