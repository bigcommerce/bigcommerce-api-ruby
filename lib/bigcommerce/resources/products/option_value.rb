# Option Value
# Values that can be selected for an option.
# https://developer.bigcommerce.com/api/stores/v2/options/values

module Bigcommerce
  class OptionValue < Resource
    include Bigcommerce::SubresourceActions.new uri: 'options/%d/values/%d'
  end
end
