# frozen_string_literal: true

require 'bigcommerce/exception'

module Bigcommerce
  module Middleware
    class HttpException < Faraday::Middleware
      include Bigcommerce::HttpErrors

      def on_complete(env)
        throw_http_exception! env[:status].to_i, env
        env
      end
    end
  end
end
