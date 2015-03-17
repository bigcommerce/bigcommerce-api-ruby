# Custom Field
# Custom fields associated with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/custom_fields

module Bigcommerce
  class CustomField < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'products/%d/custom_fields/%d')

    property :id
    property :product_id
    property :count
    property :name
    property :text

    def self.count(product_id)
      get "products/#{product_id}/custom_fields/count"
    end

    def self.count_all
      get 'products/custom_fields/count'
    end
  end
end
