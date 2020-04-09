# SKU
# Stock Keeping Unit identifiers associated with products.
# https://developer.bigcommerce.com/api/stores/v2/products/skus

module Bigcommerce
  class Variant < Resource
    include Bigcommerce::ResourceActions.new uri: 'variants/%d'

    def self.batch_update(params = [], connection: nil)
      client = connection || Bigcommerce.api
      response = client.send(:put, path.build, params)
      build_response_object response
    end
  end
end
