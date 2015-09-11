# Gift Certificates
# Code that can be applied by customers to their order to provide full or partial payment.
# No URL at this time

module Bigcommerce
  class GiftCertificates < Resource
    include Bigcommerce::ResourceActions.new uri: 'gift_certificates/%d'

    property :id
    property :customer_id
    property :order_id
    property :code
    property :to_name
    property :to_email
    property :from_name
    property :from_email
    property :amount
    property :balance
    property :status
    property :template
    property :message
    property :purchase_date
    property :expiry_date
  end
end
