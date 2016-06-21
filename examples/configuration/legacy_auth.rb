require 'bigcommerce'

Bigcommerce.configure do |config|
  config.auth = 'legacy'
  # You will get this url when registering for an API key
  config.url = ENV['BC_API_ENDPOINT_LEGACY']
  config.username = ENV['BC_USERNAME']
  config.api_key = ENV['BC_API_KEY']
end

puts Bigcommerce::System.time
