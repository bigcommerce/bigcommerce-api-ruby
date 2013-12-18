require 'spec_helper'

describe "/api/v2/orders" do
  include_context "integration"

  it "gets the orders collection", :vcr do
    orders = api.orders
    orders.should be_a_kind_of(Enumerable)
    orders.size.should be > 0
  end

  it "filters orders by date", :vcr do
    orders = api.orders_by_date('2013-03-01')
    orders.should be_a_kind_of(Enumerable)
    orders.size.should be > 0
  end

end
