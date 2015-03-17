# Product Rule
# Rules that modify the default behaviour of products.
# https://developer.bigcommerce.com/api/stores/v2/products/rules

module Bigcommerce
  class ProductRule < Resource
    include Bigcommerce::SubresourceActions.new uri: 'products/%d/rules/%d'

    property :id
    property :count
    property :product_id
    property :sort_order
    property :is_enabled
    property :is_stop
    property :price_adjuster
    property :weight_adjuster
    property :is_purchasing_disabled
    property :purchasing_disabled_message
    property :is_purchasing_hidden
    property :image_file
    property :conditions

    def self.count(product_id)
      get "products/#{product_id}/rules/count"
    end

    def self.count_all
      get 'products/rules/count'
    end
  end
end
