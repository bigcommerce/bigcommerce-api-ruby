# Price Lists
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/price-lists

module Bigcommerce
  module V3
    class PriceListRecords < Resource
      include Bigcommerce::SubresourceActions.new uri: 'pricelists/%s/records/%s'

      property :data
    end
  end
end
