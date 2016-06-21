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
    property :zip
    property :city
    property :email
    property :phone
    property :state
    property :company
    property :country
    property :cost_tax
    property :order_id
    property :street_1
    property :street_2
    property :base_cost
    property :last_name
    property :first_name
    property :cost_ex_tax
    property :items_total
    property :cost_inc_tax
    property :country_iso2
    property :items_shipped
    property :shipping_method
    property :shipping_zone_id
    property :cost_tax_class_id
    property :handling_cost_tax
    property :base_handling_cost
    property :shipping_zone_name
    property :handling_cost_ex_tax
    property :handling_cost_inc_tax
    property :handling_cost_tax_class_id
    property :count

    def self.count(order_id)
      get "orders/#{order_id}/shipping_addresses/count"
    end

    def self.count_all
      get 'orders/shipping_addresses/count'
    end
  end
end
