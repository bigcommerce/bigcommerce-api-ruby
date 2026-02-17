# frozen_string_literal: true

require 'bigcommerce/exception'

module Bigcommerce
  module Middleware
    class HttpException < Faraday::Middleware
      include Bigcommerce::HttpErrors

      def call(env)
        @app.call(env).on_complete do |response_env|
          on_complete(response_env)
        end
      end

      def on_complete(env)
        throw_http_exception! env[:status].to_i, env
        env
      end
    end
  end
end
