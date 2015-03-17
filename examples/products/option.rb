require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# Create an option
@option = Bigcommerce::Option.create(
  name: SecureRandom.hex,
  type: 'CS'
)
puts @option

# List options
puts Bigcommerce::Option.all

# Get an option
puts Bigcommerce::Option.find(@option.id)

# Get a count of options
puts Bigcommerce::Option.count

# Update an option
puts Bigcommerce::Option.update(
  @option.id,
  name: ':)',
  type: 'CS'
)

# Delete an option
puts Bigcommerce::Option.destroy(@option.id)

# Delete all options
# Bigcommerce::Option.destroy_all
