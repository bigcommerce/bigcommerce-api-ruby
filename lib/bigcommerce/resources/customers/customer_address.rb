# Customer Address
# Postal addresses belonging to a customer.
# https://developer.bigcommerce.com/api/stores/v2/customers/addresses

module Bigcommerce
  class CustomerAddress < Resource
    include Bigcommerce::SubresourceActions.new uri: 'customers/%d/addresses/%d'

    property :id
    property :customer_id
    property :first_name
    property :address_type
    property :count
    property :last_name
    property :company
    property :street_1
    property :street_2
    property :city
    property :state
    property :zip
    property :country
    property :country_iso2
    property :phone
    property :adderss_type

    def self.count_all
      get 'customers/addresses/count'
    end

    def self.count(customer_id)
      get "customers/#{customer_id}/addresses/count"
    end
  end
end
