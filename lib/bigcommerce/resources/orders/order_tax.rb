# Order Shipping Addresses
# Shipping addresses associated with an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/shipping_addresses

module Bigcommerce
  class OrderTax < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/taxes/%d',
      disable: %i[create update destroy destroy_all]
    )

    property :id
    property :name
    property :rate
    property :tax_class, from: :class
    property :order_id
    property :priority
    property :line_amount
    property :tax_rate_id
    property :tax_class_id
    property :priority_amount
    property :order_address_id
  end
end
