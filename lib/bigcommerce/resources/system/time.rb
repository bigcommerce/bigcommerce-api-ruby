# frozen_string_literal: true

# Time
# Timestamp ping to check the system status.
# https://developer.bigcommerce.com/api/stores/v2/time

module Bigcommerce
  class System < Resource
    include Bigcommerce::Request.new 'time'

    property :time

    def self.time(params = {})
      get path.build, params
    end
  end
end
