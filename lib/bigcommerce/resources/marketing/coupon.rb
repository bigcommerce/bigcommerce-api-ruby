# Coupon
# Category or product discounts that can be applied to orders for customers
# who enter a given code.
# https://developer.bigcommerce.com/api/stores/v2/coupons

module Bigcommerce
  class Coupon < Resource
    include Bigcommerce::ResourceActions.new uri: 'coupons/%d'

    def self.count(params = {})
      get 'coupons/count', params
    end
  end
end
