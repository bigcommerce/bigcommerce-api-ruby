# Blog Post
# Content entries in the store's blog.
# https://developer.bigcommerce.com/api/stores/v2/blog/posts

module Bigcommerce
  class BlogPost < Resource
    include Bigcommerce::ResourceActions.new uri: 'blog/posts/%d'

    def self.count(params = {})
      get 'blog/posts/count', params
    end
  end
end
