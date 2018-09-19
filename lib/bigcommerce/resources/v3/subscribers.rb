# Subscribers
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/subscribers/newsletter-subscribers/get-all-subscribers

module Bigcommerce
  module V3
    class Subscribers < Resource
      include Bigcommerce::ResourceActions.new uri: 'customers/subscribers/%s'

      property :data
    end
  end
end
