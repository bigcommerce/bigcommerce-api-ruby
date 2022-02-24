# frozen_string_literal: true

# Google Product Search Mapping
# Google Product Search mappings for a product.
# https://developer.bigcommerce.com/api/stores/v2/products/googleproductsearch

module Bigcommerce
  class GoogleProductSearchMapping < Resource
    include Bigcommerce::Request.new 'products/%d/googleproductsearch'

    property :size
    property :color
    property :gender
    property :enabled
    property :pattern
    property :material
    property :age_group
    property :product_id
    property :category_id
    property :custom_item
    property :global_trade_item_number
    property :manufacturer_part_number
    property :google_shopping_product_category_path

    def self.all(product_id, params = {})
      get path.build(product_id), params
    end
  end
end
