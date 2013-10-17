require 'spec_helper'

describe Bigcommerce::Api do
  include_context "mock api"

  describe "get_orders_by_date" do
    it "should accept a valid Date object" do
      date = DateTime.now
      parsed_date = described_class.new.to_rfc2822(date)
      api.connection.should_receive(:get).once.with("/orders",
                                                    {:min_date_created => parsed_date})
      api.get_orders_by_date(date)
    end

    it "should parse a valid date string" do
      date = described_class.new.to_rfc2822(DateTime.parse('2012-1-1'))
      api.connection.should_receive(:get).once.with("/orders",
                                                    {:min_date_created => date})
      api.get_orders_by_date('2012-1-1')
    end
  end
end
