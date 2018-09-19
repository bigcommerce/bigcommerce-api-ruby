# Carts
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/cart/server-to-server-cart/get-a-cart

module Bigcommerce
  module V3
    class Carts < Resource
      include Bigcommerce::ResourceActions.new uri: 'carts/%s'

      property :data
    end
  end
end
