# frozen_string_literal: true

# Configurable Field
# Configurable fields associated with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/configurable_fields

module Bigcommerce
  class ConfigurableField < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'products/%d/configurable_fields/%d',
      disable: %i[create update]
    )

    property :id
    property :product_id
    property :count
    property :name
    property :type
    property :allowed_file_types
    property :max_size
    property :select_options
    property :is_required
    property :sort_order

    def self.count(product_id, params = {})
      get "products/#{product_id}/configurable_fields/count", params
    end

    def self.count_all(params = {})
      get 'products/configurable_fields/count', params
    end
  end
end
