# Google Product Search Mapping
# Google Product Search mappings for a product.
# https://developer.bigcommerce.com/api/stores/v2/products/googleproductsearch

module Bigcommerce
  class GoogleProductSearchMapping < Resource
    include Bigcommerce::Request.new 'products/%d/googleproductsearch'

    def self.all(product_id, params = {})
      get path.build(product_id), params
    end
  end
end
