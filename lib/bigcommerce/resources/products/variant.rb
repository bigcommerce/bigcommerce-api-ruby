# SKU
# Stock Keeping Unit identifiers associated with products.
# https://developer.bigcommerce.com/api/stores/v2/products/skus

module Bigcommerce
  class Variant < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/variants/%d'

    # property :id
    # property :product_id
    # property :sku
    # property :sku_id
    # property :price
    # property :calculated_price
    # property :sale_price
    # property :retail_price
    # property :map_price
    # property :weight
    # property :calculated_weight
    # property :width
    # property :height
    # property :depth
    # property :is_free_shipping
    # property :fixed_cost_shipping_price
    # property :purchasing_disabled
    # property :purchasing_disabled_message
    # property :image_url
    # property :cost_price
    # property :upc
    # property :mpn
    # property :gtin
    # property :inventory_level
    # property :inventory_warning_level
    # property :bin_picking_number
    # property :option_values

    def self.count_all(params = {})
      get 'products/variants/count', params
    end

    def self.count(product_id, params = {})
      get "products/#{product_id}/variants/count", params
    end
  end
end
