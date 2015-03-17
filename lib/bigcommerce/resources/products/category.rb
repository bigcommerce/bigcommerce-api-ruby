# Category
# Index of hierarchical categories used to organise and group products.
# https://developer.bigcommerce.com/api/stores/v2/categories

module Bigcommerce
  class Category < Resource
    include Bigcommerce::ResourceActions.new uri: 'categories/%d'

    property :id
    property :parent_id
    property :name
    property :count
    property :description
    property :sort_order
    property :page_title
    property :meta_keywords
    property :meta_description
    property :layout_file
    property :parent_category_list
    property :image_file
    property :is_visible
    property :search_keywords
    property :url

    def self.count
      get 'categories/count'
    end
  end
end
