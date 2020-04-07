# Option Set
# A reusable set of option facets that can be applied to products.
# https://developer.bigcommerce.com/api/stores/v2/options_sets

module Bigcommerce
  class OptionSet < Resource
    include Bigcommerce::ResourceActions.new uri: 'option_sets/%d'

    def self.count(params = {})
      get 'option_sets/count', params
    end
  end
end
