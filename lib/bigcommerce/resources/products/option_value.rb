# Option Value
# Values that can be selected for an option.
# https://developer.bigcommerce.com/api/stores/v2/options/values

module Bigcommerce
  class OptionValue < Resource
    include Bigcommerce::SubresourceActions.new uri: 'options/%d/values/%d'

    property :id
    property :option_id
    property :label
    property :sort_order
    property :value
    property :is_default
  end
end
