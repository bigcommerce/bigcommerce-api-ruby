# Order Coupon
# Coupons applied to an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/coupons

module Bigcommerce
  class OrderCoupon < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/coupons/%d',
      disable: [:create, :update, :destroy, :destroy_all])

    property :id
    property :coupon_id
    property :order_id
    property :code
    property :amount
    property :type
    property :type
    property :discount
  end
end
