require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List categories
@categories = Bigcommerce::Category.all
puts @categories

# Get a category
@category = @categories[0]
puts Bigcommerce::Category.find(@category.id)

# Get a count of categories
puts Bigcommerce::Category.count

# Create a category
@category = Bigcommerce::Category.create(
  name: SecureRandom.hex
)
puts @category

# Update a category
puts Bigcommerce::Category.update(
  @category.id,
  name: 'Foobar'
)

# Delete a category
puts Bigcommerce::Category.destroy(@category.id)

# Delete all categories
# Bigcommerce::Category.destroy_all
