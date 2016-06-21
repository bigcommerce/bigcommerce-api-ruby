require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List brands
@brands = Bigcommerce::Brand.all(page: 1)

# Get a brand
puts Bigcommerce::Brand.find(@brands.first.id)

# Get a count of brands
puts Bigcommerce::Brand.count

# Create a brand
@brand = Bigcommerce::Brand.create(
  name: SecureRandom.hex,
  page_title: "Title #{SecureRandom.hex}"
)
puts @brand

# Update a brand
puts Bigcommerce::Brand.update(
  @brand.id,
  name: 'Foobar'
)

# Delete a brand
puts Bigcommerce::Brand.destroy(@brand.id)

# Delete all brands
# Bigcommerce::Brand.destroy_all
