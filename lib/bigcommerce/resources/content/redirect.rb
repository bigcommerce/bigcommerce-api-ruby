# Redirect
# Redirects are used to create custom URL paths that map to resources on the
# storefront (such as products, categories, brands, etc.) or manually defined
# static URLs.
# https://developer.bigcommerce.com/api/stores/v2/redirects

module Bigcommerce
  class Redirect < Resource
    include Bigcommerce::ResourceActions.new uri: 'redirects/%d'

    def self.count(params = {})
      get 'redirects/count', params
    end
  end
end
