# Order Shipment
# Shipping package consignments tracked from an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/shipments

module Bigcommerce
  class Shipment < Resource
    include Bigcommerce::SubresourceActions.new uri: 'orders/%d/shipments/%d'

    def self.count(order_id, params = {})
      get "orders/#{order_id}/shipments/count", params
    end

    def self.count_all(params = {})
      get 'orders/shipments/count', params
    end
  end
end
