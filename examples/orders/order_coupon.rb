require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@order = Bigcommerce::Order.all[0]

# List order coupons
@order_coupons = Bigcommerce::OrderCoupon.all(@order.id)
puts @order_coupons

# Get an order coupon
@order_coupon = @order_coupons[0]
puts Bigcommerce::OrderCoupon.find(@order.id, @order_coupon.id)
