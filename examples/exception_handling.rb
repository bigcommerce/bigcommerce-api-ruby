require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# rubocop:disable MethodLength, Metrics/AbcSize:
def bc_handle_exception(&block)
  # Below is a list of all the errors we will throw
  block.call
rescue Bigcommerce::BadRequest => e
  puts e.inspect
rescue Bigcommerce::Unauthorized => e
  puts e.inspect
rescue Bigcommerce::Forbidden => e
  puts e.inspect
rescue Bigcommerce::NotFound => e
  puts e.inspect
rescue Bigcommerce::MethodNotAllowed => e
  puts e.inspect
rescue Bigcommerce::NotAccepted => e
  puts e.inspect
rescue Bigcommerce::TimeOut => e
  puts e.inspect
rescue Bigcommerce::ResourceConflict => e
  puts e.inspect
rescue Bigcommerce::TooManyRequests => e
  puts e.inspect
rescue Bigcommerce::InternalServerError => e
  puts e.inspect
rescue Bigcommerce::BadGateway => e
  puts e.inspect
rescue Bigcommerce::ServiceUnavailable => e
  puts e.inspect
rescue Bigcommerce::GatewayTimeout => e
  puts e.inspect
rescue Bigcommerce::BandwidthLimitExceeded => e
  puts e.inspect
rescue => e
  puts "Some other Error #{e.inspect}"
end

Bigcommerce::HttpError::ERRORS.each do |k, v|
  bc_handle_exception do
    # This will be your request that you want to protect from exceptions
    fail v, k
  end
end
