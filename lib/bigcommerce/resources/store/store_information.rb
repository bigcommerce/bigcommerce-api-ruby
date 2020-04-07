# Store Information
# Metadata that describes the store.
# https://developer.bigcommerce.com/api/stores/v2/store_information

module Bigcommerce
  class StoreInfo < Resource
    include Bigcommerce::Request.new 'store'

    def self.info(params = {})
      get path.build, params
    end
  end
end
