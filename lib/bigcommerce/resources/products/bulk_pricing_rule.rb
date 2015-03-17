# Bulk Pricing Rule
# Bulk pricing rules applied to a product.
# https://developer.bigcommerce.com/api/stores/v2/products/discount_rules

module Bigcommerce
  class BulkPricingRule < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'products/%d/discount_rules/%d')

    property :id
    property :count
    property :product_id
    property :min
    property :max
    property :type
    property :type_value

    def self.count(product_id)
      get "products/#{product_id}/discount_rules/count"
    end

    def self.count_all
      get 'products/discount_rules/count'
    end
  end
end
