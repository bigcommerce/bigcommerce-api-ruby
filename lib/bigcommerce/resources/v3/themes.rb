# Themes
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/themes/themes

module Bigcommerce
  module V3
    class Themes < Resource
      include Bigcommerce::ResourceActions.new uri: 'themes/%s'

      property :data
    end
  end
end
