# frozen_string_literal: true

module Bigcommerce
  class Config < Hashie::Mash
    BC_API_ENDPOINT_ENV_KEY = 'BC_API_ENDPOINT'
    DEFAULTS = {
      base_url: 'https://api.bigcommerce.com'
    }.freeze

    ##
    # @return [String]
    #
    def api_url
      return url if auth == 'legacy'

      "#{base_url}/stores/#{store_hash}/v2"
    end

    private

    ##
    # @return [String]
    #
    def base_url
      ENV[BC_API_ENDPOINT_ENV_KEY].to_s.empty? ? DEFAULTS[:base_url] : ENV.fetch(BC_API_ENDPOINT_ENV_KEY, nil)
    end
  end
end
