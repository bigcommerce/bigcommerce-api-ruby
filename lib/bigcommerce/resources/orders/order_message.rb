# Order Message
# Messages associated with an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/messages

module Bigcommerce
  class OrderMessage < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/messages/%d',
      disable: %i[create update destroy destroy_all]
    )

    property :id
    property :type
    property :status
    property :message
    property :subject
    property :customer
    property :order_id
    property :staff_id
    property :is_flagged
    property :customer_id
    property :date_created
  end
end
