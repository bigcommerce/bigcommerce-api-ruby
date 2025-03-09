# frozen_string_literal: true

module Bigcommerce
  module Middleware
    class Auth < Faraday::Middleware
      X_AUTH_CLIENT_HEADER = 'X-Auth-Client'
      X_AUTH_TOKEN_HEADER = 'X-Auth-Token'

      def on_request(env)
        env[:request_headers][X_AUTH_CLIENT_HEADER] = options[:client_id]
        env[:request_headers][X_AUTH_TOKEN_HEADER] = options[:access_token]
      end
    end
  end
end
