# Product
# Catalog of saleable items in the store.
# https://developer.bigcommerce.com/api/stores/v2/products

module Bigcommerce
  class Product < Resource
    include Bigcommerce::ResourceActions.new uri: 'products/%d'

    def self.count(params = {})
      get 'products/count', params
    end
  end
end
