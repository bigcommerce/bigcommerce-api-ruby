require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@product = Bigcommerce::Product.all[0]

# List configurable fields
@configurable_fields = Bigcommerce::ConfigurableField.all(@product.id)
puts @configurable_fields

# Get a configurable field
@configurable_field = @configurable_fields[0]
puts Bigcommerce::ConfigurableField.all(@product.id, @configurable_field.id)

# Get a count of configurable fields
puts Bigcommerce::ConfigurableField.count(@product.id)

# Get a count of all configurable fields for all products
puts Bigcommerce::ConfigurableField.count(@product.id)

# Delete a configurable field
puts Bigcommerce::ConfigurableField.destroy(@product.id, @configurable_field.id)

# Delete multiple configurable fields
# puts Bigcommerce::ConfigurableField.destroy_all(@product.id)
