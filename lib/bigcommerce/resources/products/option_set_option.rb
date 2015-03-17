# Option Set Option
# Options belonging to an option set.
# https://developer.bigcommerce.com/api/stores/v2/option_sets/options

module Bigcommerce
  class OptionSetOption < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: 'option_sets/%d/options/%d')

    property :id
    property :option_id
    property :option_set_id
    property :display_name
    property :sort_order
    property :is_required
    property :option
    property :values
  end
end
