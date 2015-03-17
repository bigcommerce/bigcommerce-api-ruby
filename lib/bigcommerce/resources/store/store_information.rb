# Store Information
# Metadata that describes the store.
# https://developer.bigcommerce.com/api/stores/v2/store_information

module Bigcommerce
  class StoreInfo < Resource
    include Bigcommerce::Request.new 'store'

    property :id
    property :domain
    property :name
    property :address
    property :phone
    property :admin_email
    property :order_email
    property :language
    property :currency
    property :currency_symbol
    property :decimal_separator
    property :thousands_separator
    property :decimal_places
    property :dimension_decimal_places
    property :dimension_decimal_token
    property :dimension_thousands_token
    property :currency_symbol_location
    property :is_price_entered_with_tax
    property :active_comparison_modules
    property :weight_units
    property :dimension_units
    property :plan_name
    property :logo

    def self.info
      get path.build
    end
  end
end
