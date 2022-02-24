# frozen_string_literal: true

module Bigcommerce
  class DummyResourceActionsClass
    include ResourceActions.new(uri: 'http://foo.bar/%d')
  end

  class DummySubresourceActionsClass
    include SubresourceActions.new(uri: 'http://foo.bar/%d/%d')
  end
end
