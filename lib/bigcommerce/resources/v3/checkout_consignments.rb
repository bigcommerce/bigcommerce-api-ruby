# Checkouts
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/checkout/create-a-cart

module Bigcommerce
  module V3
    class CheckoutConsignments < Resource
      include Bigcommerce::SubresourceActions.new uri: 'checkouts/%s/consignments/%s'

      property :data
    end
  end
end
