# Option Set Option
# Options belonging to an option set.
# https://developer.bigcommerce.com/api/stores/v2/option_sets/options

module Bigcommerce
  class OptionSetOption < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'option_sets/%d/options/%d'
    )
  end
end
