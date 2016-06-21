require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@order = Bigcommerce::Order.find(104)

# List order messages
@order_messages = Bigcommerce::OrderMessage.all(@order.id)
puts @order_messages

# Get an order message
@order_message = @order_messages[0]
puts Bigcommerce::OrderMessage.find(@order.id, @order_message.id)
