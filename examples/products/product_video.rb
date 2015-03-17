require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@product = Bigcommerce::Product.all[0]

# Create a product video
@product_video = Bigcommerce::ProductVideo.create(
  @product.id,
  url: 'https://www.youtube.com/watch?v=T9RFb8xXZlk'
)
puts @product_video

# List product videos
@product_videos = Bigcommerce::ProductVideo.all(@product.id)
puts @product_videos

# Get a count of product videos
puts Bigcommerce::ProductVideo.count(@product.id)

# Get a count of all product videos for all products
puts Bigcommerce::ProductVideo.count_all

# Get a product video
puts Bigcommerce::ProductVideo.find(@product.id, @product_video.id)

# Update a product video
# TODO
# puts Bigcommerce::ProductVideo.update(
# @product.id,
# @product_video.id,
# url: 'https://www.youtube.com/watch?v=LXgTp40Y3zo'
# )

# Delete a product video
# TODO
# puts Bigcommerce::ProductVideo.destroy(@product.id, product_video.id)

# Delete all product videos
# TODO
# puts Bigcommerce::ProductVideo.destroy_all(@product.id)
