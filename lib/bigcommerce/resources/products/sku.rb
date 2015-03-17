# SKU
# Stock Keeping Unit identifiers associated with products.
# https://developer.bigcommerce.com/api/stores/v2/products/skus

module Bigcommerce
  class Sku < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/skus/%d'

    property :id
    property :product_id
    property :sku
    property :cost_price
    property :count
    property :upc
    property :inventory_level
    property :intentory_warning_level
    property :bin_picking_number
    property :options
    property :inventory_warning_level

    def self.count_all
      get 'products/skus/count'
    end

    def self.count(product_id)
      get "products/#{product_id}/skus/count"
    end
  end
end
