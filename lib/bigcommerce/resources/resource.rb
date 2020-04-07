require 'bigcommerce/request'
require 'bigcommerce/resource_actions'
require 'bigcommerce/subresource_actions'

module Bigcommerce
  class Resource < Hashie::Mash
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::IgnoreUndeclared
  end
end
