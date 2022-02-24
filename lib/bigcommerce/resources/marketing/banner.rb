# frozen_string_literal: true

# Banner
# HTML element on webpages to advertise discounts or other content relevant to shoppers.
# https://developer.bigcommerce.com/api/stores/v2/banners

module Bigcommerce
  class Banner < Resource
    include Bigcommerce::ResourceActions.new uri: 'banners/%d'

    property :id
    property :name
    property :content
    property :page
    property :catorbrandid
    property :location
    property :date_created
    property :date_type
    property :date_from
    property :date_to
    property :status
  end
end
