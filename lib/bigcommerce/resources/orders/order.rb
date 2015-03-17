# Order
# Purchases from a store.
# https://developer.bigcommerce.com/api/stores/v2/orders

module Bigcommerce
  class Order < Resource
    include Bigcommerce::ResourceActions.new uri: 'orders/%d'

    property :id
    property :count
    property :customer_id
    property :date_created
    property :date_modified
    property :date_shipped
    property :status_id
    property :status
    property :subtotal_ex_tax
    property :subtotal_inc_tax
    property :subtotal_tax
    property :base_shipping_cost
    property :shipping_cost_ex_tax
    property :shipping_cost_inc_tax
    property :shipping_cost_tax
    property :shipping_cost_tax_class_id
    property :base_handling_cost
    property :handling_cost_ex_tax
    property :handling_cost_inc_tax
    property :handling_cost_tax
    property :handling_cost_tax_class_id
    property :base_wrapping_cost
    property :wrapping_cost_ex_tax
    property :wrapping_cost_inc_tax
    property :wrapping_cost_tax
    property :wrapping_cost_tax_class_id
    property :total_ex_tax
    property :total_inc_tax
    property :total_tax
    property :items_total
    property :items_shipped
    property :payment_method
    property :payment_provider_id
    property :payment_status
    property :refunded_amount
    property :order_is_digital
    property :store_credit_amount
    property :gift_certificate_amount
    property :ip_address
    property :geoip_country
    property :geoip_country_iso2
    property :currency_id
    property :currency_code
    property :currency_exchange_rate
    property :default_currency_id
    property :default_currency_code
    property :staff_notes
    property :customer_message
    property :discount_amount
    property :coupon_discount
    property :shipping_address_count
    property :is_deleted
    property :ebay_order_id
    property :billing_address
    property :order_source
    property :external_source
    property :products
    property :shipping_addresses
    property :coupons

    def self.count(params = {})
      get 'orders/count', params
    end
  end
end
