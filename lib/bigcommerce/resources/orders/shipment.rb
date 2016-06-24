# Order Shipment
# Shipping package consignments tracked from an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/shipments

module Bigcommerce
  class Shipment < Resource
    include Bigcommerce::SubresourceActions.new uri: 'orders/%d/shipments/%d'

    property :id
    property :items
    property :comments
    property :order_id
    property :customer_id
    property :date_created
    property :billing_address
    property :shipping_method
    property :tracking_number
    property :order_address_id
    property :shipping_address
    property :shipping_provider
    property :count

    def self.count(order_id, params = {})
      get "orders/#{order_id}/shipments/count", params
    end

    def self.count_all(params = {})
      get 'orders/shipments/count', params
    end
  end
end
