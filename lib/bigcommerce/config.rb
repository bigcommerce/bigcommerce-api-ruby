module Bigcommerce
  class Config < Hashie::Mash
    DEFAULTS = {
      base_url: 'https://api.bigcommerce.com'
    }.freeze

    def api_url
      return url if auth == 'legacy'

      version = api_version || 'v3/catalog'
      base = ENV['BC_API_ENDPOINT'].to_s.empty? ? DEFAULTS[:base_url] : ENV['BC_API_ENDPOINT']
      "#{base}/stores/#{store_hash}/#{version}"
    end
  end
end
