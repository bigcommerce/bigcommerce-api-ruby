# Google Product Search Mapping
# Google Product Search mappings for a product.
# https://developer.bigcommerce.com/api/stores/v2/products/googleproductsearch

module Bigcommerce
  class GoogleProductSearchMapping < Resource
    include Bigcommerce::Request.new 'products/%d/googleproductsearch'

    property :enabled
    property :product_id
    property :category_id
    property :custom_item
    property :global_trade_item_number
    property :manufacturer_part_number
    property :gender
    property :age_group
    property :color
    property :size
    property :material
    property :pattern

    def self.all(product_id)
      get path.build(product_id)
    end
  end
end
