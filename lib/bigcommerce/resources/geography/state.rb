# State
# States and subdivisions belonging to countries.
# https://developer.bigcommerce.com/api/stores/v2/countries/states

module Bigcommerce
  class State < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'countries/%d/states/%d',
      disable: [:create, :update, :destroy, :destroy_all]
    )

    property :id
    property :count
    property :state
    property :state_abbreviation
    property :country_id

    def self.count(country_id)
      get "countries/#{country_id}/states/count"
    end

    def self.count_all
      get 'countries/states/count'
    end
  end
end
