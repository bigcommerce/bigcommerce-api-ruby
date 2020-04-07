# Product Review
# Options associated directly with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/reviews

module Bigcommerce
  class ProductReview < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/reviews/%d'
  end
end
