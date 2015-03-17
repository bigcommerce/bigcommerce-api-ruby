# Coupon
# Category or product discounts that can be applied to orders for customers
# who enter a given code.
# https://developer.bigcommerce.com/api/stores/v2/coupons

module Bigcommerce
  class Coupon < Resource
    include Bigcommerce::ResourceActions.new uri: 'coupons/%d'

    property :id
    property :name
    property :type
    property :count
    property :amount
    property :min_purchase
    property :expires
    property :enabled
    property :code
    property :applies_to
    property :num_uses
    property :max_uses
    property :max_uses_per_customer
    property :restricted_to
    property :shipping_methods

    def self.count
      get 'coupons/count'
    end
  end
end
