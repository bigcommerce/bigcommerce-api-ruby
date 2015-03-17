require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@product = Bigcommerce::Product.all[0]

# Create a product sku
@sku = Bigcommerce::Sku.create(
  @product.id,
  sku: SecureRandom.hex,
  options: [
    product_option_id: 95,
    option_value_id: 10
  ]
)
puts @sku

# List product skus
@skus = Bigcommerce::Sku.all(@product.id)
puts @skus

# Get a count of product skus
puts Bigcommerce::Sku.count

# Get a product sku
puts Bigcommerce::Sku.find(@product.id, @sku.id)

# Update a product sku
puts Bigcommerce::Sku.update(
  @product.id,
  @sku.id,
  sku: SecureRandom.hex,
  options: [
    product_option_id: 95,
    option_value_id: 7
  ]
)

# Delete a product image
puts Bigcommerce::Sku.destroy(@product.id, @sku.id)

# Delete all product skus
# puts Bigcommerce::Sku.destroy_all(@product.id)
