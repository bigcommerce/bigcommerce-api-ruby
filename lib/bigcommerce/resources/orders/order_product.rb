# Order Product
# Product line items associated with an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/products

module Bigcommerce
  class OrderProduct < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/products/%d',
      disable: [:create, :update, :destroy, :destroy_all])

    property :id
    property :order_id
    property :product_id
    property :order_address_id
    property :name
    property :sku
    property :type
    property :count
    property :base_price
    property :price_ex_tax
    property :price_inc_tax
    property :price_tax
    property :base_total
    property :total_ex_tax
    property :total_inc_tax
    property :total_tax
    property :weight
    property :quantity
    property :base_cost_price
    property :cost_price_inc_tax
    property :cost_price_ex_tax
    property :cost_price_tax
    property :is_refunded
    property :refund_amount
    property :return_id
    property :wrapping_name
    property :base_wrapping_cost
    property :wrapping_cost_ex_tax
    property :wrapping_cost_inc_tax
    property :wrapping_cost_tax
    property :wrapping_message
    property :quantity_shipped
    property :event_name
    property :event_date
    property :fixed_shipping_cost
    property :ebay_item_id
    property :ebay_transaction_id
    property :option_set_id
    property :parent_order_product_id
    property :is_bundled_product, from: :'is_bundled_product '
    property :bin_picking_number
    property :applied_discounts
    property :product_options
    property :configurable_fields

    def self.count(order_id)
      get "orders/#{order_id}/products/count"
    end

    def self.count_all
      get 'orders/products/count'
    end
  end
end
