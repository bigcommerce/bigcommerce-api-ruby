# Order Transactions
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/orders/order-transactions

module Bigcommerce
  module V3
    class OrderTransactions < Resource
      include Bigcommerce::ResourceActions.new uri: 'orders/%d/transactions/%s'

      property :data
    end
  end
end
