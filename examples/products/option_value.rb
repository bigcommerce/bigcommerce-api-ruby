require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@option = Bigcommerce::Option.create(
  name: SecureRandom.hex,
  type: 'CS'
)

# Create an option value
@option_value = Bigcommerce::OptionValue.create(
  @option.id,
  label: SecureRandom.hex,
  sort_order: 0,
  value: '#FFFFFF'
)
puts @option_value

# List option values
puts Bigcommerce::OptionValue.all(@option.id)

# Get an option value
puts Bigcommerce::OptionValue.find(@option.id, @option_value.id)

# Update an option value
puts Bigcommerce::OptionValue.update(
  @option.id,
  @option_value.id,
  label: SecureRandom.hex,
  sort_order: 0,
  value: '#000000'
)

# Delete an option value
puts Bigcommerce::OptionValue.destroy(@option.id, @option_value.id)

# Delete multiple option values
# puts Bigcommerce::OptionValue.destroy_all(@option.id)
