# Product Review
# Options associated directly with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/reviews

module Bigcommerce
  class ProductReview < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/reviews/%d'

    property :id
    property :title
    property :author
    property :rating
    property :review
    property :status
    property :product_id
    property :date_created
  end
end
