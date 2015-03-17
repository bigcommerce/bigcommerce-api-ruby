require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List redirects
@redirects = Bigcommerce::Redirect.all(page: 1)
puts @redirects

# Get a redirect
puts Bigcommerce::Redirect.find(@redirects[0].id)

# Get a count of redirects
puts Bigcommerce::Redirect.count

# Create a redirect
@redirect = Bigcommerce::Redirect.create(
  path: '/womens_clothing',
  forward: {
    type: 'category',
    ref: 3
  }
)
puts @redirect

# Update a redirect
puts Bigcommerce::Redirect.update(
  @redirect.id,
  path: '/womens_clothing',
  forward: {
    type: 'category',
    ref: 3
  }
)

# Delete a redirect
puts Bigcommerce::Redirect.destroy(@redirect.id)

# Delete all redirects
# puts Bigcommerce::Redirect.destroy_all
