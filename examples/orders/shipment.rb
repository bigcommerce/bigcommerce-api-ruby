require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@order = Bigcommerce::Order.all[0]

# Create a shipment
@order_product = Bigcommerce::OrderProduct.all(@order.id)[0]

@order_address = Bigcommerce::OrderShippingAddress.all(@order.id)[0]

@shipment = Bigcommerce::Shipment.create(
  @order.id,
  tracking_number: 'ups12345',
  comments: 'Notes about the shipment',
  order_address_id: @order_address.id,
  items: [
    {
      order_product_id: @order_product.id,
      quantity: 1
    }
  ]
)
puts @shipment

# List shipments
@shipments = Bigcommerce::Shipment.all(@order.id)
puts @shipments

# Get a shipment
@shipment = @shipments[0]
puts Bigcommerce::Shipment.find(@order.id, @shipment.id)

# Get a count of shipments
puts Bigcommerce::Shipment.count(@order.id)

# Get a count of all shipments for all orders
puts Bigcommerce::Shipment.count_all

# Update a shipment
puts Bigcommerce::Shipment.update(
  @order.id,
  @shipment.id,
  tracking_number: 'fedex1245',
  comments: 'Notes about the shipment',
  order_address_id: @order_address.id
)

# Delete a shipment
puts Bigcommerce::Shipment.destroy(@order.id, @shipment.id)

# Delete multiple shipments
# puts Bigcommerce::Shipment.destroy_all(@order.id)
