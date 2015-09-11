require 'bigcommerce'

Bigcommerce.configure do |config|
  config.auth = 'legacy'
  # You will get this url when registering for an API key
  config.url = ENV.fetch('BC_API_ENDPOINT_LEGACY')
  config.username = ENV.fetch('BC_USERNAME')
  config.api_key = ENV.fetch('BC_API_KEY')
end

# List banners
@banners = Bigcommerce::Banner.all
puts @banners

# Get a banner
puts Bigcommerce::Banner.find(@banner.first.id)

# Create a banner
# For 'page', you can use: 'home_page', 'category_page', 'brand_page', and 'searchpage'.
# For 'location', you can use: 'top' or 'bottom'.
# For 'date_type', you can use: 'always' or 'custom'.
# When using date_type: 'custom', you must add 'date_from' and 'date_to' values.
@banner = Bigcommerce::Banner.create(
  name:      'Fourth of July Banner',
  content:   '10% sale for our grand closing until February 24th! Use code: DUSTY10',
  page:      'home_page',
  location:  'top',
  date_type: 'always'
)
puts @banner

# Update a banner
@banner.update(content: 'I have been updated.')

# Delete a banner
puts Bigcommerce::Banner.destroy(@banner.id)

# Delete all banners
puts Bigcommerce::Banner.destroy_all
