# frozen_string_literal: true

# Product Image
# Images associated with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/images

module Bigcommerce
  class ProductImage < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/images/%d'

    property :id
    property :count
    property :product_id
    property :image_file
    property :is_thumbnail
    property :sort_order
    property :zoom_url
    property :thumbnail_url
    property :standard_url
    property :tiny_url
    property :is_sample
    property :description
    property :date_created

    def self.count(product_id, params = {})
      get "products/#{product_id}/images/count", params
    end

    def self.count_all(params = {})
      get 'products/images/count', params
    end
  end
end
