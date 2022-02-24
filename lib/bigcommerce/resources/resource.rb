# frozen_string_literal: true

require 'bigcommerce/request'
require 'bigcommerce/resource_actions'
require 'bigcommerce/subresource_actions'

module Bigcommerce
  class Resource < Hashie::Trash
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::IgnoreUndeclared
  end
end
