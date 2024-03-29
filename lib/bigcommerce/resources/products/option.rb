# frozen_string_literal: true

# Option
# Shared attributes that control value facets on a product.
# https://developer.bigcommerce.com/api/stores/v2/options

module Bigcommerce
  class Option < Resource
    include Bigcommerce::ResourceActions.new uri: 'options/%d'

    property :id
    property :name
    property :count
    property :display_name
    property :type
    property :values

    def self.count(params = {})
      get 'options/count', params
    end
  end
end
