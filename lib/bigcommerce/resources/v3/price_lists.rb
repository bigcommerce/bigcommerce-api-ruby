# Price Lists
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/price-lists

module Bigcommerce
  module V3
    class PriceLists < Resource
      include Bigcommerce::ResourceActions.new uri: 'pricelists/%s'

      property :data
    end
  end
end
