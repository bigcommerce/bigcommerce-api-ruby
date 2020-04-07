# Customer Address
# Postal addresses belonging to a customer.
# https://developer.bigcommerce.com/api/stores/v2/customers/addresses

module Bigcommerce
  class CustomerAddress < Resource
    include Bigcommerce::SubresourceActions.new uri: 'customers/%d/addresses/%d'

    def self.count_all(params = {})
      get 'customers/addresses/count', params
    end

    def self.count(customer_id, params = {})
      get "customers/#{customer_id}/addresses/count", params
    end
  end
end
