# Product Rule
# Rules that modify the default behaviour of products.
# https://developer.bigcommerce.com/api/stores/v2/products/rules

module Bigcommerce
  class ProductRule < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/rules/%d'

    def self.count(product_id, params = {})
      get "products/#{product_id}/rules/count", params
    end

    def self.count_all(params = {})
      get 'products/rules/count', params
    end
  end
end
