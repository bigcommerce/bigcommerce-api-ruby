require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@product = Bigcommerce::Product.all[0]

# List product images
@product_images = Bigcommerce::ProductImage.all(@product.id)
puts @product_images

# Get a count of product images
puts Bigcommerce::ProductImage.count(@product.id)

# Get a count of all product images for all products
puts Bigcommerce::ProductImage.count_all

# Create a product image
@product_image = Bigcommerce::ProductImage.create(
  @product.id,
  image_file: 'http://i.imgur.com/Z5aV28x.gif'
)
puts @product_image

# Get a product image
puts Bigcommerce::ProductImage.find(@product.id, @product_image.id)

# Update a product image
puts Bigcommerce::ProductImage.update(
  @product.id,
  @product_image.id,
  image_file: 'http://i.imgur.com/4Dl6Y9d.gif'
)

# Delete a product image
puts Bigcommerce::ProductImage.destroy(@product.id, @product_image.id)

# Delete all product images
# puts Bigcommerce::ProductImage.destroy_all(@product.id)
