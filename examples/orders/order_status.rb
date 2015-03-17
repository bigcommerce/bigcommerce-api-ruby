require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List order statuses
@order_statuses = Bigcommerce::OrderStatus.all
puts @order_statuses

# Get an order status
@order_status = @order_statuses[0]
puts Bigcommerce::OrderStatus.find(@order_status.id)
