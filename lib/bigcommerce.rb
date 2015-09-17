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
    attr_accessor :api_limit

    def configure
      config = Hashie::Mash.new

      yield(config)

      @tenant_single_thread = build_client(config)
    end

    # keeps faraday api client for the duration of the thread
    # ensures every thread has their own faraday api client.
    @tenant_threadsafe = {}

    # Threadsafe method of configuring bigcommerce.
    #
    # @example Rails controller
    #
    #     around_filter :configure_bigcommerce
    #
    #     protected
    #
    #     def configure_bigcommerce
    #       config = {store_hash: session[:store_hash], client_id: "..", access_token: ".."}
    #       Bigcommerce.configure_threadsafe(config) do
    #         yield
    #       end
    #     end
    #
    def configure_threadsafe(config, &_block)
      fail 'Already initialized with Bigcommerce.configure' if @tenant_single_thread
      config = Hashie::Mash.new(config)
      tenant = config.store_hash

      @tenant_threadsafe[tenant] = build_client(config)

      yield

    ensure
      # Make sure we don't leak memory
      @tenant_threadsafe.delete(tenant)
      clear_thread!
    end

    def api
      @tenant_single_thread || @tenant_threadsafe[tenant]
    end

    def build_url(config)
      return config.url if config.auth == 'legacy'

      base = ENV['BC_API_ENDPOINT'].nil? ? DEFAULTS[:base_url] : ENV['BC_API_ENDPOINT']
      "#{base}/stores/#{config.store_hash}/v2"
    end

    protected

    def build_client(config)
      ssl_options = config.ssl if config.auth == 'legacy'

      Faraday.new(url: build_url(config), ssl: ssl_options) do |conn|
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

    def clear_thread!
      @tenant_threadsafe[tenant]
      self.tenant = nil
    end

    def tenant
      Thread.current[:bc_api_tenant]
    end

    def tenant=(val)
      Thread.current[:bc_api_tenant] = val
    end
  end
end
