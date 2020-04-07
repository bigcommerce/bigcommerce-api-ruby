# Blog Tag
# Index of tags used on the store's blog.
# https://developer.bigcommerce.com/api/stores/v2/blog/tags

module Bigcommerce
  class BlogTag < Resource
    include Bigcommerce::Request.new 'blog/tags'

    def self.all(params = {})
      get path.build, params
    end
  end
end
