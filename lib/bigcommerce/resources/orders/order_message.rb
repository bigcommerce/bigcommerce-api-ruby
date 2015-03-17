# Order Message
# Messages associated with an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/messages

module Bigcommerce
  class OrderMessage < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'orders/%d/messages/%d',
      disable: [:create, :update, :destroy, :destroy_all])

    property :id
    property :order_id
    property :staff_id
    property :customer_id
    property :type
    property :subject
    property :message
    property :status
    property :is_flagged
    property :date_created
    property :customer
  end
end
