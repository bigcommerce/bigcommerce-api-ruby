# Catalog Products
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/catalog/products

module Bigcommerce
  module V3
    class ProductModifiers < Resource
      include Bigcommerce::SubresourceActions.new uri: 'catalog/products/%d/modifiers/%d'

      property :data
    end
  end
end
