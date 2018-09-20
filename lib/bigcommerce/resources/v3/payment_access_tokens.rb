# Catalog Products
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/catalog/products

module Bigcommerce
  module V3
    class PaymentAccessToken < Resource
      include Bigcommerce::ResourceActions.new uri: 'payments/access_tokens/%s'

      property :data
    end
  end
end
