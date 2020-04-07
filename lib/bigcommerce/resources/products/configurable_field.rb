# Configurable Field
# Configurable fields associated with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/configurable_fields

module Bigcommerce
  class ConfigurableField < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'products/%d/configurable_fields/%d',
      disable: %i[create update]
    )

    def self.count(product_id, params = {})
      get "products/#{product_id}/configurable_fields/count", params
    end

    def self.count_all(params = {})
      get 'products/configurable_fields/count', params
    end
  end
end
