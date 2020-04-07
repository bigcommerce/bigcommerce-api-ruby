# Brand
# Brand facets for identifying and categorising products according
# to their manufacturer or company metonym.
# https://developer.bigcommerce.com/api/stores/v2/brands

module Bigcommerce
  class Brand < Resource
    include Bigcommerce::ResourceActions.new uri: 'brands/%d'

    def self.count(params = {})
      get 'brands/count', params
    end
  end
end
