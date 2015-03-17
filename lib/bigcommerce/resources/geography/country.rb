# Country
# Countries and territories, identified by their ISO 3166 country codes.
# https://developer.bigcommerce.com/api/stores/v2/countries

module Bigcommerce
  class Country < Resource
    include Bigcommerce::ResourceActions.new(
      uri: 'countries/%d',
      disable: [:create, :update, :destroy, :destroy_all])

    property :id
    property :count
    property :country
    property :country_iso2
    property :country_iso3
    property :states

    def self.count
      get 'countries/count'
    end
  end
end
