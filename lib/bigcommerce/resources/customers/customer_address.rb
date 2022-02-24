# frozen_string_literal: true

# Customer Address
# Postal addresses belonging to a customer.
# https://developer.bigcommerce.com/api/stores/v2/customers/addresses

module Bigcommerce
  class CustomerAddress < Resource
    include Bigcommerce::SubresourceActions.new uri: 'customers/%d/addresses/%d'

    property :id
    property :customer_id
    property :form_fields
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

    def self.count_all(params = {})
      get 'customers/addresses/count', params
    end

    def self.count(customer_id, params = {})
      get "customers/#{customer_id}/addresses/count", params
    end
  end
end
