require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List products
@products = Bigcommerce::Product.all
puts @products

# Get a product
@product = @products[0]
puts Bigcommerce::Product.find(@product.id)

# Get products count
puts Bigcommerce::Product.count

# Create a product
@category = Bigcommerce::Category.all[0]
@product = Bigcommerce::Product.create(
  name: SecureRandom.hex,
  type: 'physical',
  description: SecureRandom.hex,
  price: '19.95',
  categories: [@category.id],
  availability: 'available',
  weight: '0.5'
)
puts @product

# Update a product
puts Bigcommerce::Product.update(
  @product.id,
  custom_url: '/foo-bar/'
)

# Delete a product
puts Bigcommerce::Product.destroy(@product.id)

# Delete all products
# puts Bigcommerce::Product.destroy_all
