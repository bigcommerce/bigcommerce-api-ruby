# Carts
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/cart/server-to-server-cart/get-a-cart

module Bigcommerce
  module V3
    class CartItems < Resource
      include Bigcommerce::SubresourceActions.new uri: 'carts/%s/items/%s'

      property :data
    end
  end
end
