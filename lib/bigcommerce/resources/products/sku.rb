# SKU
# Stock Keeping Unit identifiers associated with products.
# https://developer.bigcommerce.com/api/stores/v2/products/skus

module Bigcommerce
  class Sku < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/skus/%d'

    def self.count_all(params = {})
      get 'products/skus/count', params
    end

    def self.count(product_id, params = {})
      get "products/#{product_id}/skus/count", params
    end
  end
end
