# Order Shipping Addresses
# Shipping addresses associated with an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/shipping_addresses

module Bigcommerce
  class OrderShippingAddress < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/shipping_addresses/%d',
      disable: %i[create update destroy destroy_all]
    )

    def self.count(order_id, params = {})
      get "orders/#{order_id}/shipping_addresses/count", params
    end

    def self.count_all(params = {})
      get 'orders/shipping_addresses/count', params
    end
  end
end
