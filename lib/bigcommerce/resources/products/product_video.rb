# Product Video
# Embedded videos displayed on product listings.
# https://developer.bigcommerce.com/api/stores/v2/products/videos

module Bigcommerce
  class ProductVideo < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/videos/%s'

    def self.count(product_id, params = {})
      get "products/#{product_id}/videos/count", params
    end

    def self.count_all(params = {})
      get 'products/videos/count', params
    end
  end
end
