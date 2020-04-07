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
  end
end
