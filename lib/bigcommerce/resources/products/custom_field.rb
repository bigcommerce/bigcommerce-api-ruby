# Custom Field
# Custom fields associated with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/custom_fields

module Bigcommerce
  class CustomField < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'products/%d/custom_fields/%d'
    )

    property :id
    property :product_id
    property :count
    property :name
    property :text

    def self.count(product_id, params = {})
      get "products/#{product_id}/custom_fields/count", params
    end

    def self.count_all(params = {})
      get 'products/custom_fields/count', params
    end
  end
end
