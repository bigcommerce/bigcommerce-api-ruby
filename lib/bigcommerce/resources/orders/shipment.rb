# Order Shipment
# Shipping package consignments tracked from an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/shipments

module Bigcommerce
  class Shipment < Resource
    include Bigcommerce::SubresourceActions.new uri: 'orders/%d/shipments/%d'

    property :id
    property :order_id
    property :count
    property :customer_id
    property :order_address_id
    property :date_created
    property :tracking_number
    property :shipping_method
    property :comments
    property :billing_address
    property :shipping_address
    property :items

    def self.count(order_id)
      get "orders/#{order_id}/shipments/count"
    end

    def self.count_all
      get 'orders/shipments/count'
    end
  end
end
