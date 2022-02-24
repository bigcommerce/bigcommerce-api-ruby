# frozen_string_literal: true

module Bigcommerce
  class HttpError < StandardError
    attr_accessor :response_headers

    def initialize(headers)
      @response_headers = headers
      super()
    end
  end

  class BadRequest < HttpError; end
  class Unauthorized < HttpError; end
  class Forbidden < HttpError; end
  class NotFound < HttpError; end
  class MethodNotAllowed < HttpError; end
  class NotAccepted < HttpError; end
  class TimeOut < HttpError; end
  class ResourceConflict < HttpError; end
  class TooManyRequests < HttpError; end
  class InternalServerError < HttpError; end
  class BadGateway < HttpError; end
  class ServiceUnavailable < HttpError; end
  class GatewayTimeout < HttpError; end
  class BandwidthLimitExceeded < HttpError; end

  module HttpErrors
    ERRORS = {
      400 => Bigcommerce::BadRequest,
      401 => Bigcommerce::Unauthorized,
      403 => Bigcommerce::Forbidden,
      404 => Bigcommerce::NotFound,
      405 => Bigcommerce::MethodNotAllowed,
      406 => Bigcommerce::NotAccepted,
      408 => Bigcommerce::TimeOut,
      409 => Bigcommerce::ResourceConflict,
      429 => Bigcommerce::TooManyRequests,
      500 => Bigcommerce::InternalServerError,
      502 => Bigcommerce::BadGateway,
      503 => Bigcommerce::ServiceUnavailable,
      504 => Bigcommerce::GatewayTimeout,
      509 => Bigcommerce::BandwidthLimitExceeded
    }.freeze

    X_RETRY_AFTER_HEADER_KEY = 'x-retry-after'

    def throw_http_exception!(code, env)
      return unless ERRORS.key?(code)

      response_headers = Faraday::Utils::Headers.new(env.response_headers)

      unless response_headers[X_RETRY_AFTER_HEADER_KEY].nil?
        response_headers[:retry_after] = response_headers[X_RETRY_AFTER_HEADER_KEY].to_i
      end

      raise ERRORS[code].new(response_headers), env.body
    end
  end
end
