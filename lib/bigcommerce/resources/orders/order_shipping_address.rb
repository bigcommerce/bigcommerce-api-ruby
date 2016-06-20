# Order Shipping Addresses
# Shipping addresses associated with an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/shipping_addresses

module Bigcommerce
  class OrderShippingAddress < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/shipping_addresses/%d',
      disable: [:create, :update, :destroy, :destroy_all]
    )

    property :id
    property :order_id
    property :count
    property :first_name
    property :last_name
    property :company
    property :street_1
    property :street_2
    property :city
    property :zip
    property :country
    property :country_iso2
    property :state
    property :email
    property :phone
    property :items_total
    property :items_shipped
    property :shipping_method
    property :base_cost
    property :cost_ex_tax
    property :cost_inc_tax
    property :cost_tax
    property :cost_tax_class_id
    property :base_handling_cost
    property :handling_cost_ex_tax
    property :handling_cost_inc_tax
    property :handling_cost_tax
    property :handling_cost_tax_class_id
    property :shipping_zone_id
    property :shipping_zone_name

    def self.count(order_id)
      get "orders/#{order_id}/shipping_addresses/count"
    end

    def self.count_all
      get 'orders/shipping_addresses/count'
    end
  end
end
