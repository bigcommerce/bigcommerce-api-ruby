# Webhook
# Register and manage webhooks that connect events from a store to
# external URLs.
# https://developer.bigcommerce.com/api/stores/v2/webhooks

module Bigcommerce
  class Webhook < Resource
    include Bigcommerce::ResourceActions.new(
      uri: 'hooks/%d',
      disable: [:destroy_all]
    )

    property :id
    property :client_id
    property :store_hash
    property :scope
    property :destination
    property :headers
    property :is_active
    property :created_at
    property :update_at
  end
end
