require 'bigcommerce'
require 'securerandom'

Bigcommerce.configure do |config|
  config.auth = 'legacy'
  # You will get this url when registering for an API key
  config.url = ENV.fetch('BC_API_ENDPOINT_LEGACY')
  config.username = ENV.fetch('BC_USERNAME')
  config.api_key = ENV.fetch('BC_API_KEY')
end

# List gift certificates
@gift_certificates = Bigcommerce::GiftCertificates.all
puts @gift_certificates

# Get a gift certificate
puts Bigcommerce::GiftCertificates.find(@gift_certificates.first.id)

# Create a gift certificate
@gift_certificate = Bigcommerce::GiftCertificates.create(
  to_name:    'Test',
  to_email:   'test@test.com',
  from_name:  'Test2',
  from_email: 'othertest@test.com',
  code:       SecureRandom.hex,
  amount:     100
)
puts @gift_certificate

# Update an instance of a gift certificate
puts @gift_certificates.first.update(balance: 50)

# Update a gift certificate
puts Bigcommerce::GiftCertificates.update(@gift_certificates.first.id, balance: 50)

# Delete a gift certificate
puts Bigcommerce::GiftCertificates.destroy(@gift_certificates.first.id)

# Delete all gift certificates
# puts Bigcommerce::GiftCertificates.destroy_all
