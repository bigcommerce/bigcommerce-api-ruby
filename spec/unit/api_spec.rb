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

  describe "#create-orders-shipments" do
    it "should accept an order id parameter" do
      api.connection.should_receive(:post).once.with("/orders/123/shipments", {})
      api.create_orders_shipments(123)
    end

    it "should accept an order id parameter and an options hash" do
      options = Hash[*('A'..'Z').to_a.flatten]
      api.connection.should_receive(:post).once.with("/orders/123/shipments", options)
      api.create_orders_shipments(123, options)
    end
  end
end
