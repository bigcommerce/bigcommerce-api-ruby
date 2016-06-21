require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@product = Bigcommerce::Product.all[0]

# List product reviews
puts Bigcommerce::ProductReview.all(@product.id)

# List product review
@product_reviews = Bigcommerce::ProductReview.all(@product.id)
puts @product_reviews

# Create a product review
@product_review = Bigcommerce::ProductReview.create(
  @product.id,
  author: 'Jimmy Doe',
  rating: 5,
  review: 'It was grrrreat!',
  title: 'A+'
)
puts @product_review

# Get a product review
puts Bigcommerce::ProductReview.find(@product.id, @product_review.id)

# Update a product review
puts Bigcommerce::ProductReview.update(
  @product.id,
  @product_review.id,
  author: 'John Doe',
  rating: 4,
  review: 'It was great!',
  title: 'A'
)

# Delete a product review
puts Bigcommerce::ProductReview.destroy(@product.id, @product_review.id)

# Delete all product review
# puts Bigcommerce::ProductReview.destroy_all(@product.id)
