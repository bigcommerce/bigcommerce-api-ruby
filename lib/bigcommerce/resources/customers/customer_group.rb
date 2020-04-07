# Customer Group
# Groups of customers who share the same level of access and discounts
# at a store.
# https://developer.bigcommerce.com/api/stores/v2/customer_groups

module Bigcommerce
  class CustomerGroup < Resource
    include Bigcommerce::ResourceActions.new uri: 'customer_groups/%d'

    def self.count(params = {})
      get 'customer_groups/count', params
    end
  end
end
