# Gift Certificates
# Code that can be applied by customers to their order to provide full or partial payment.
# https://developer.bigcommerce.com/api/stores/v2/gift_certificates

module Bigcommerce
  class GiftCertificates < Resource
    include Bigcommerce::ResourceActions.new uri: 'gift_certificates/%d'
  end
end
