# State
# States and subdivisions belonging to countries.
# https://developer.bigcommerce.com/api/stores/v2/countries/states

module Bigcommerce
  class State < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'countries/%d/states/%d',
      disable: %i[create update destroy destroy_all]
    )

    def self.count(country_id, params = {})
      get "countries/#{country_id}/states/count", params
    end

    def self.count_all(params = {})
      get 'countries/states/count', params
    end
  end
end
