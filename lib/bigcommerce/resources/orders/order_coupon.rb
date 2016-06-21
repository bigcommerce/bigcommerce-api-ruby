# Order Coupon
# Coupons applied to an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/coupons

module Bigcommerce
  class OrderCoupon < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/coupons/%d',
      disable: [:create, :update, :destroy, :destroy_all]
    )

    property :id
    property :code
    property :type
    property :amount
    property :discount
    property :order_id
    property :coupon_id
  end
end
