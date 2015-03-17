require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@option_set = Bigcommerce::OptionSet.create(
  name: SecureRandom.hex
)

@option = Bigcommerce::Option.create(
  name: SecureRandom.hex,
  type: 'CS'
)

# Create an option set option
@option_set_option = Bigcommerce::OptionSetOption.create(
  @option_set.id,
  option_id: @option.id,
  display_name: SecureRandom.hex,
  sort_order: 1,
  is_required: true
)
puts @option_set_option

# List option set options
puts Bigcommerce::OptionSetOption.all(@option_set.id)

puts Bigcommerce::OptionSetOption.count(@option_set.id)

# Get an option set option
puts Bigcommerce::OptionSetOption.find(@option_set.id, @option_set_option.id)

# Update an option set option
puts Bigcommerce::OptionSetOption.update(
  @option_set.id,
  @option_set_option.id,
  display_name: 'Pick a color...',
  sort_order: 2,
  is_required: false
)

# Delete an option set option
puts Bigcommerce::OptionSetOption.destroy(@option_set.id, @option_set_option.id)

# Delete multiple option set options
# puts Bigcommerce::OptionSetOption.destroy_all(@option_set.id)
