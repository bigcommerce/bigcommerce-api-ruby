require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@order = Bigcommerce::Order.find(110)

# List order taxes
@order_taxes = Bigcommerce::OrderTax.all(@order.id)
puts @order_taxes

# Get an order tax
@order_tax = @order_taxes[0]
puts Bigcommerce::OrderTax.find(@order.id, @order_tax.id)
