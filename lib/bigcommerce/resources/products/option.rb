# Option
# Shared attributes that control value facets on a product.
# https://developer.bigcommerce.com/api/stores/v2/options

module Bigcommerce
  class Option < Resource
    include Bigcommerce::ResourceActions.new uri: 'options/%d'

    def self.count(params = {})
      get 'options/count', params
    end
  end
end
