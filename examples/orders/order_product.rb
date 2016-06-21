require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@order = Bigcommerce::Order.find(104)

# List order products
@order_products = Bigcommerce::OrderProduct.all(@order.id)
puts @order_products

# Get an order product
@order_product = @order_products[0]
puts Bigcommerce::OrderProduct.find(@order.id, @order_product.id)

# Get a count of order products
puts Bigcommerce::OrderProduct.count(@order.id)

# Get a count of all order products for all orders
puts Bigcommerce::OrderProduct.count_all
