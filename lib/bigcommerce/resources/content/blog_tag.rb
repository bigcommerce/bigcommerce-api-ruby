# Blog Tag
# Index of tags used on the store's blog.
# https://developer.bigcommerce.com/api/stores/v2/blog/tags

module Bigcommerce
  class BlogTag < Resource
    include Bigcommerce::Request.new 'blog/tags'

    property :id
    property :tag
    property :post_ids

    def self.all
      get path.build
    end
  end
end
