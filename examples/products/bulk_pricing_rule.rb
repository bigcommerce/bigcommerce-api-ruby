require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

@product = Bigcommerce::Product.all[0]

# Create a products bulk pricing rule
@bulk_pricing_rule = Bigcommerce::BulkPricingRule.create(
  @product.id,
  min: 1,
  max: 5,
  type: 'price',
  type_value: 2
)
puts @bulk_pricing_rule

# List bulk pricing rules
puts Bigcommerce::BulkPricingRule.all(@product.id)

# Get a product bulk pricing rule
puts Bigcommerce::BulkPricingRule.find(@product.id, @bulk_pricing_rule.id)

# Get a count of bulk pricing rules
puts Bigcommerce::BulkPricingRule.count(@product.id)

# Get a count of all bulk pricing rules for all products
puts Bigcommerce::BulkPricingRule.count_all

# Update a bulk pricing rule
puts Bigcommerce::BulkPricingRule.update(
  @product.id,
  @bulk_pricing_rule.id,
  min: 2,
  type: 'price',
  type_value: 2
)

# Delete a product bulk pricing rule
puts Bigcommerce::BulkPricingRule.destroy(@product.id, @bulk_pricing_rule.id)

# Delete multiple bulk pricing rules
# puts Bigcommerce::BulkPricingRule.destroy(@product.id)
