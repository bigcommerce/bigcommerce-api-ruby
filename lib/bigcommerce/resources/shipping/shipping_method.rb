# Shipping Method
# List of enabled shipping methods.
# https://developer.bigcommerce.com/api/stores/v2/shipping/methods

module Bigcommerce
  class ShippingMethod < Resource
    include Bigcommerce::ResourceActions.new(
      uri: 'shipping/methods/%d',
      disable: %i[create update destroy destroy_all]
    )
  end
end
