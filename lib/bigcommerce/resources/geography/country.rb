# Country
# Countries and territories, identified by their ISO 3166 country codes.
# https://developer.bigcommerce.com/api/stores/v2/countries

module Bigcommerce
  class Country < Resource
    include Bigcommerce::ResourceActions.new(
      uri: 'countries/%d',
      disable: %i[create update destroy destroy_all]
    )

    def self.count(params = {})
      get 'countries/count', params
    end
  end
end
