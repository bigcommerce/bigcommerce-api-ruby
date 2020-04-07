# Order Message
# Messages associated with an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/messages

module Bigcommerce
  class OrderMessage < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/messages/%d',
      disable: %i[create update destroy destroy_all]
    )
  end
end
