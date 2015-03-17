# Customer
# Identity and account details for customers shopping at a Bigcommerce store.
# https://developer.bigcommerce.com/api/stores/v2/customers

module Bigcommerce
  class Customer < Resource
    include Bigcommerce::ResourceActions.new uri: 'customers/%d'

    property :id
    property :_authentication
    property :count
    property :company
    property :first_name
    property :last_name
    property :email
    property :phone
    property :date_created
    property :date_modified
    property :store_credit
    property :registration_ip_address
    property :customer_group_id
    property :notes
    property :addresses
    property :tax_exempt_category

    def self.count
      get 'customers/count'
    end
  end
end
