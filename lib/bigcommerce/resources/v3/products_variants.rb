# Catalog Products
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/catalog/products

module Bigcommerce
  module V3
    class ProductVariants < Resource
      include Bigcommerce::SubresourceActions.new uri: 'catalog/products/%d/variants?id:in=%d'

      property :data
    end
  end
end
