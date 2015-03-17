require 'bigcommerce'

Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# List all webhooks
puts Bigcommerce::Webhook.all

# Get a webhook
puts Bigcommerce::Webhook.find(1)

# Create a webhook
@webhook = Bigcommerce::Webhook.create(
  scope: 'store/order/*',
  destination: 'https://app.example.com/orders'
)

# Update a webhook
puts Bigcommerce::Webhook.update(
  @webhook.id,
  scope: 'store/order/*',
  destination: 'https://app.example.com/products'
)

# Delete a webhook
puts Bigcommerce::Webhook.destroy(@webhook.id)
