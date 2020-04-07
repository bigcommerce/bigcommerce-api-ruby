# Order
# Purchases from a store.
# https://developer.bigcommerce.com/api/stores/v2/orders

module Bigcommerce
  class Order < Resource
    include Bigcommerce::ResourceActions.new uri: 'orders/%d'

    def self.count(params = {})
      get 'orders/count', params
    end
  end
end
