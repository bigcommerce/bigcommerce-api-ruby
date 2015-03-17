require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@product = Bigcommerce::Product.all[0]

# Create a custom field
@custom_field = Bigcommerce::CustomField.create(
  @product.id,
  name: SecureRandom.hex,
  text: SecureRandom.hex
)
puts @custom_field

# List custom fields
puts Bigcommerce::CustomField.all(@product.id)

# Get a custom field
puts Bigcommerce::CustomField.find(@product.id, @custom_field.id)

# Get a count of custom fields
puts Bigcommerce::CustomField.count(@product.id)

# Get a count of custom fields for all products
puts Bigcommerce::CustomField.count_all

# Update a custom field
puts Bigcommerce::CustomField.update(
  @product.id,
  @custom_field.id,
  name: ':)',
  text: ':)'
)

# Delete a custom field
puts Bigcommerce::CustomField.destroy(@product.id, @custom_field.id)

# Delete multiple custom fields
# puts Bigcommerce::CustomField.destroy_all(@product.id)
