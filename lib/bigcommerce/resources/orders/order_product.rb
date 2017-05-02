# Order Product
# Product line items associated with an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/products

module Bigcommerce
  class OrderProduct < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/products/%d',
      disable: %i[create update destroy destroy_all]
    )

    property :id
    property :sku
    property :name
    property :type
    property :weight
    property :order_id
    property :quantity
    property :price_tax
    property :return_id
    property :total_tax
    property :base_price
    property :base_total
    property :event_date
    property :event_name
    property :product_id
    property :is_refunded
    property :ebay_item_id
    property :price_ex_tax
    property :total_ex_tax
    property :option_set_id
    property :price_inc_tax
    property :refund_amount
    property :total_inc_tax
    property :wrapping_name
    property :cost_price_tax
    property :base_cost_price
    property :product_options
    property :order_address_id
    property :quantity_shipped
    property :wrapping_message
    property :applied_discounts
    property :cost_price_ex_tax
    property :wrapping_cost_tax
    property :base_wrapping_cost
    property :bin_picking_number
    property :cost_price_inc_tax
    property :configurable_fields
    property :ebay_transaction_id
    property :fixed_shipping_cost
    property :is_bundled_product
    property :wrapping_cost_ex_tax
    property :wrapping_cost_inc_tax
    property :parent_order_product_id
    property :count

    def self.count(order_id, params = {})
      get "orders/#{order_id}/products/count", params
    end

    def self.count_all(params = {})
      get 'orders/products/count', params
    end
  end
end
