# Order Product
# Product line items associated with an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/products

module Bigcommerce
  class OrderProduct < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/products/%d',
      disable: %i[create update destroy destroy_all]
    )

    def self.count(order_id, params = {})
      get "orders/#{order_id}/products/count", params
    end

    def self.count_all(params = {})
      get 'orders/products/count', params
    end
  end
end
