# Product Option
# Options associated directly with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/options

module Bigcommerce
  class ProductOption < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'products/%d/options/%d',
      disable: %i[create update destroy destroy_all]
    )
  end
end
