# frozen_string_literal: true

module Bigcommerce
  module Middleware
    class Auth < Faraday::Middleware
      X_AUTH_CLIENT_HEADER = 'X-Auth-Client'
      X_AUTH_TOKEN_HEADER = 'X-Auth-Token'

      def initialize(app, options = {})
        super
      end

      def call(env)
        env[:request_headers][X_AUTH_CLIENT_HEADER] = option_value(:client_id)
        env[:request_headers][X_AUTH_TOKEN_HEADER] = option_value(:access_token)
        @app.call env
      end

      private

      def option_value(key)
        @options[key] || @options[key.to_s]
      end
    end
  end
end
