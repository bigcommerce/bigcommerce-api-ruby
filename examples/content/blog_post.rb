require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List blog posts
@posts = Bigcommerce::BlogPost.all(page: 1)
puts @posts

# Get a blog post
puts Bigcommerce::BlogPost.find(@posts[0].id)

# Get a count of blog posts
puts Bigcommerce::BlogPost.count

# Create a blog post
@post = Bigcommerce::BlogPost.create(
  title: 'Brand new producrts for sale!',
  body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do \
         eiusmod tempor incididunt ut labore et dolore magna aliqua. \
         Excepteur sint occaecat cupidatat non proident, sunt in culpa qui \
         officia deserunt mollit anim id est laborum.'
)
puts @post

# Update a blog post
puts Bigcommerce::BlogPost.update(
  @post.id,
  title: 'Oops wrong title.'
)

# Delete a blog post
puts Bigcommerce::BlogPost.destroy(@post.id)

# Delete all blog posts
# puts Bigcommerce::BlogPost.destroy_all
