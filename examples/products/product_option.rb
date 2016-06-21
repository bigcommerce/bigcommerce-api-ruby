require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@product = Bigcommerce::Product.find(6)

# List product options
@product_options = Bigcommerce::ProductOption.all(@product.id)
puts @product_options

# Get a product option
@product_option = @product_options[0]
puts Bigcommerce::ProductOption.find(@product.id, @product_option.id)
