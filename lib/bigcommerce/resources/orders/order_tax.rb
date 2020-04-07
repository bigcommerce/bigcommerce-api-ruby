# Order Shipping Addresses
# Shipping addresses associated with an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/shipping_addresses

module Bigcommerce
  class OrderTax < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/taxes/%d',
      disable: %i[create update destroy destroy_all]
    )
  end
end
