module Bigcommerce
  class HttpError < StandardError
    attr_accessor :response_headers
    def initialize(headers)
      @response_headers = headers
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
      422 => Bigcommerce::ResourceConflict,
      429 => Bigcommerce::TooManyRequests,
      500 => Bigcommerce::InternalServerError,
      502 => Bigcommerce::BadGateway,
      503 => Bigcommerce::ServiceUnavailable,
      504 => Bigcommerce::GatewayTimeout,
      509 => Bigcommerce::BandwidthLimitExceeded
    }.freeze

    def throw_http_exception!(code, env)
      return unless ERRORS.keys.include? code
      response_headers = {}
      unless env.body.empty?
        response_headers = begin
          JSON.parse(env.body, symbolize_names: true)
        rescue StandardError
          {}
        end
      end
      unless env[:response_headers] && env[:response_headers]['X-Retry-After'].nil?
        response_headers[:retry_after] = env[:response_headers]['X-Retry-After'].to_i
      end
      raise ERRORS[code].new(response_headers), env.body
    end
  end
end
