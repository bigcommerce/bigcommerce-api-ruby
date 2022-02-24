# frozen_string_literal: true

# Order
# Purchases from a store.
# https://developer.bigcommerce.com/api/stores/v2/orders

module Bigcommerce
  class Order < Resource
    include Bigcommerce::ResourceActions.new uri: 'orders/%d'

    property :id
    property :status
    property :coupons
    property :products
    property :status_id
    property :total_tax
    property :ip_address
    property :is_deleted
    property :currency_id
    property :customer_id
    property :items_total
    property :staff_notes
    property :date_created
    property :date_shipped
    property :order_source
    property :subtotal_tax
    property :total_ex_tax
    property :currency_code
    property :date_modified
    property :ebay_order_id
    property :geoip_country
    property :items_shipped
    property :total_inc_tax
    property :payment_method
    property :payment_status
    property :billing_address
    property :coupon_discount
    property :discount_amount
    property :external_source
    property :is_email_opt_in
    property :refunded_amount
    property :subtotal_ex_tax
    property :credit_card_type
    property :customer_message
    property :order_is_digital
    property :subtotal_inc_tax
    property :handling_cost_tax
    property :shipping_cost_tax
    property :wrapping_cost_tax
    property :base_handling_cost
    property :base_shipping_cost
    property :base_wrapping_cost
    property :geoip_country_iso2
    property :shipping_addresses
    property :default_currency_id
    property :payment_provider_id
    property :store_credit_amount
    property :handling_cost_ex_tax
    property :shipping_cost_ex_tax
    property :wrapping_cost_ex_tax
    property :default_currency_code
    property :handling_cost_inc_tax
    property :shipping_cost_inc_tax
    property :wrapping_cost_inc_tax
    property :currency_exchange_rate
    property :shipping_address_count
    property :gift_certificate_amount
    property :handling_cost_tax_class_id
    property :shipping_cost_tax_class_id
    property :wrapping_cost_tax_class_id
    property :count

    def self.count(params = {})
      get 'orders/count', params
    end
  end
end
