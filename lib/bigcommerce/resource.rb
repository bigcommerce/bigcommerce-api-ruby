module Bigcommerce
  module Resource

    # For convenience: see http://www.railstips.org/blog/archives/2009/05/15/include-vs-extend-in-ruby/
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      attr_accessor :fields, :filters

      def all
        res = EventMachine::HttpRequest.new(@endpoint).get(@auth_headers).response
        if res == ""
          return {}
        else
          JSON.parse(EventMachine::HttpRequest.new(@endpoint).get(@auth_headers).response)
        end
      end

    end

  end
end
