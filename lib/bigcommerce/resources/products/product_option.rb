# frozen_string_literal: true

# Product Option
# Options associated directly with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/options

module Bigcommerce
  class ProductOption < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'products/%d/options/%d',
      disable: %i[create update destroy destroy_all]
    )

    property :id
    property :option_id
    property :display_name
    property :sort_order
    property :is_required
  end
end
