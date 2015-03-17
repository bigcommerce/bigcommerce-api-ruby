# Payment Method
# Enabled payment methods.
# https://developer.bigcommerce.com/api/stores/v2/payments/methods

module Bigcommerce
  class PaymentMethod < Resource
    include Bigcommerce::Request.new 'payments/methods'

    property :code
    property :name
    property :test_mode

    def self.all(params = {})
      get path.build, params
    end
  end
end
