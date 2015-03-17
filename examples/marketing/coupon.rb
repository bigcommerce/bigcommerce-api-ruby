require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List coupons
@coupons = Bigcommerce::Coupon.all
puts @coupons

# Get a coupon
puts Bigcommerce::Coupon.find(@coupons[0].id)

# Get a count of coupons
puts Bigcommerce::Coupon.count

# Create a coupon
@coupon = Bigcommerce::Coupon.create(
  name: SecureRandom.hex,
  code: SecureRandom.hex,
  type: 'per_item_discount',
  amount: 5,
  applies_to: {
    entity: 'categories',
    ids: [0]
  }
)
puts @coupon

# Update a coupon
puts Bigcommerce::Coupon.update(
  @coupon.id,
  name: SecureRandom.hex,
  amount: 10
)

# Delete a coupon
puts Bigcommerce::Coupon.destroy(@coupon.id)

# Delete all coupons
# puts Bigcommerce::Coupon.destroy_all
