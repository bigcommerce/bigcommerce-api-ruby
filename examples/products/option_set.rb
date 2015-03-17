require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# Create an option set
@option_set = Bigcommerce::OptionSet.create(
  name: SecureRandom.hex
)
puts @option_set

# List option sets
puts Bigcommerce::OptionSet.all

# Get an option set
puts Bigcommerce::OptionSet.find(@option_set.id)

# Get a count of option sets
puts Bigcommerce::OptionSet.count

# Update an option set
puts Bigcommerce::OptionSet.update(
  @option_set.id,
  name: ':)'
)

# Delete an option set
puts Bigcommerce::OptionSet.destroy(@option_set.id)

# Delete all option sets
# Bigcommerce::OptionSet.destroy_all
