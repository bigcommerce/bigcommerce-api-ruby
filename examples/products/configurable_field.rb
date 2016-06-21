require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@product = Bigcommerce::Product.find(6)

# List configurable fields
@configurable_fields = Bigcommerce::ConfigurableField.all(@product.id)
puts @configurable_fields

# Get a configurable field
puts Bigcommerce::ConfigurableField.all(@product.id, @configurable_fields.first)

# Get a count of configurable fields
puts Bigcommerce::ConfigurableField.count(@product.id)

# Delete a configurable field
puts Bigcommerce::ConfigurableField.destroy(@product.id, @configurable_fields.first.id)

# Delete multiple configurable fields
# puts Bigcommerce::ConfigurableField.destroy_all(@product.id)
