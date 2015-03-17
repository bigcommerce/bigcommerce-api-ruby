require 'hashie'
require 'faraday_middleware'
require 'bigcommerce/version'
require 'bigcommerce/middleware/auth'
require 'bigcommerce/middleware/http_exception'
require 'bigcommerce/resources/resource'

module Bigcommerce
  resources = File.join(File.dirname(__FILE__), 'bigcommerce', 'resources', '**', '*.rb')
  Dir.glob(resources, &method(:require))

  DEFAULTS = {
    base_url: 'https://api.bigcommerce.com'
  }

  HEADERS = {
    'accept' => 'application/json',
    'content-type' => 'application/json',
    'user-agent' => 'bigcommerce-api-ruby'
  }

  class << self
    attr_reader :api
    attr_accessor :api_limit

    def configure
      config = Hashie::Mash.new
      yield(config)
      ssl_options = config.ssl if config.auth == 'legacy'

      @api = Faraday.new(url: build_url(config), ssl: ssl_options) do |conn|
        conn.request :json
        conn.headers = HEADERS
        if config.auth == 'legacy'
          conn.use Faraday::Request::BasicAuthentication, config.username, config.api_key
        else
          conn.use Bigcommerce::Middleware::Auth, config
        end
        conn.use Bigcommerce::Middleware::HttpException
        conn.adapter Faraday.default_adapter
      end
    end

    def build_url(config)
      return config.url if config.auth == 'legacy'

      base = ENV['BC_API_ENDPOINT'].nil? ? DEFAULTS[:base_url] : ENV['BC_API_ENDPOINT']
      "#{base}/stores/#{config.store_hash}/v2"
    end
  end
end
