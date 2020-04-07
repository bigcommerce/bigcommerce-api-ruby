# Order Coupon
# Coupons applied to an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/coupons

module Bigcommerce
  class OrderCoupon < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/coupons/%d',
      disable: %i[create update destroy destroy_all]
    )
  end
end
