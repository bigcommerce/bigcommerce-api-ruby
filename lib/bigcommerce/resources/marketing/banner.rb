# Banner
# HTML element on webpages to advertise discounts or other content relevant to shoppers.
# https://developer.bigcommerce.com/api/stores/v2/banners

module Bigcommerce
  class Banner < Resource
    include Bigcommerce::ResourceActions.new uri: 'banners/%d'
  end
end
