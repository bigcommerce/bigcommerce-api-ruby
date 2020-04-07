# SKU
# Stock Keeping Unit identifiers associated with products.
# https://developer.bigcommerce.com/api/stores/v2/products/skus

module Bigcommerce
  class Variant < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/variants/%d'

    def self.count_all(params = {})
      get 'products/variants/count', params
    end

    def self.count(product_id, params = {})
      get "products/#{product_id}/variants/count", params
    end
  end
end
