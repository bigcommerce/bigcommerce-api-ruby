require 'jwt'
require 'securerandom'

# Customer
# Identity and account details for customers shopping at a Bigcommerce store.
# https://developer.bigcommerce.com/api/stores/v2/customers

module Bigcommerce
  class Customer < Resource
    include Bigcommerce::ResourceActions.new uri: 'customers/%d'

    def self.count(params = {})
      get 'customers/count', params
    end

    # Generate a token that can be used to log the customer into the storefront.
    # This requires your app to have the store_v2_customers_login scope and to
    # be installed in the store.
    def login_token(config: Bigcommerce.config)
      payload = {
        'iss' => config.client_id,
        'iat' => Time.now.to_i,
        'jti' => SecureRandom.uuid,
        'operation' => 'customer_login',
        'store_hash' => config.store_hash,
        'customer_id' => id
      }

      JWT.encode(payload, config.client_secret, 'HS256')
    end
  end
end
