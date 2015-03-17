# Product Review
# Options associated directly with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/reviews

module Bigcommerce
  class ProductReview < Resource
    include Bigcommerce::Request.new 'products/%d/reviews'

    property :id
    property :product_id
    property :author
    property :date_created
    property :rating
    property :title
    property :review
    property :status

    def self.all(product_id)
      get path.build(product_id)
    end
  end
end
