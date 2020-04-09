# Product Image
# Images associated with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/variants

module Bigcommerce
  class ProductVariant < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/variants/%d'
  end
end
