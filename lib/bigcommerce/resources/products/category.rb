# Category
# Index of hierarchical categories used to organise and group products.
# https://developer.bigcommerce.com/api/stores/v2/categories

module Bigcommerce
  class Category < Resource
    include Bigcommerce::ResourceActions.new uri: 'categories/%d'

    def self.count(params = {})
      get 'categories/count', params
    end
  end
end
