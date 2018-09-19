# Checkouts
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/checkout/create-a-cart

module Bigcommerce
  module V3
    class Checkouts < Resource
      include Bigcommerce::ResourceActions.new uri: 'checkouts/%s'

      property :data
    end
  end
end
