# Payment Method
# Enabled payment methods.
# https://developer.bigcommerce.com/api/stores/v2/payments/methods

module Bigcommerce
  class PaymentMethod < Resource
    include Bigcommerce::Request.new 'payments/methods'

    def self.all(params = {})
      get path.build, params
    end
  end
end
