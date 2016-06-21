require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@product = Bigcommerce::Product.find(6)

# List product rules
@product_rules = Bigcommerce::ProductRule.all(@product.id)
puts @product_rules

# Get a count of product rules
puts Bigcommerce::ProductRule.count(@product.id)

# Get a count of all product rules for all products
puts Bigcommerce::ProductRule.count_all

# Create a product rule
@product_rule = Bigcommerce::ProductRule.create(
  @product.id,
  conditions: [
    {
      product_option_id: 3,
      option_value_id: 73,
      sku_id: nil
    }
  ]
)
puts @product_rule

# Get a product rule
puts Bigcommerce::ProductRule.find(@product.id, @product_rule.id)

# Update a product rule
puts Bigcommerce::ProductRule.update(
  @product.id,
  @product_rule.id,
  conditions: [
    {
      product_option_id: 3,
      option_value_id: 73,
      sku_id: nil
    }
  ]
)

# Delete a product rule
puts Bigcommerce::ProductRule.destroy(@product.id, @product_rule.id)

# Delete all product rules
# puts Bigcommerce::ProductRule.destroy_all(@product.id)
