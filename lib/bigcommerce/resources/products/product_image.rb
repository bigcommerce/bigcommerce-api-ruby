# Product Image
# Images associated with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/images

module Bigcommerce
  class ProductImage < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/images/%d'

    def self.count(product_id, params = {})
      get "products/#{product_id}/images/count", params
    end

    def self.count_all(params = {})
      get 'products/images/count', params
    end
  end
end
