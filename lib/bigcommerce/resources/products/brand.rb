# Brand
# Brand facets for identifying and categorising products according
# to their manufacturer or company metonym.
# https://developer.bigcommerce.com/api/stores/v2/brands

module Bigcommerce
  class Brand < Resource
    include Bigcommerce::ResourceActions.new uri: 'brands/%d'

    property :id
    property :name
    property :count
    property :page_title
    property :meta_keywords
    property :meta_description
    property :image_file
    property :search_keywords

    def self.count
      get 'brands/count'
    end
  end
end
