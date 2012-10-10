require 'spec_helper'

describe BigCommerce::Api do
  before do
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:get, %r|https://test:12345@store-12345.mybigcommerce.com/api/v2/orders|, :body => load_json_fixture('order'), :status => 200, :content_type => "text/json")
    FakeWeb.register_uri(:get, %r|https://test:12345@store-12345.mybigcommerce.com/api/v2/time|, :body => load_json_fixture('time'), :status => 200, :content_type => "text/json")
  end
  after do
    FakeWeb.clean_registry
  end

  let(:api) do
    BigCommerce::Api.new({
      :store_url => "https://store-12345.mybigcommerce.com",
      :username => "test", :api_key => "12345"
    })
  end

  let(:rfc2822_datetime) { "Tue, 13 Mar 2012 12:45:26 +0000" }
  let(:rfc2822_date)     { "Mon, 12 Mar 2012 00:00:00 +0000" }

  describe "Time" do
    it "converts times to RFC 2822 format" do
      api.to_rfc2822(DateTime.parse('2012-03-13 12:45:26 +0000')).should eql rfc2822_datetime
    end
    it "converts dates to RFC 2822 format" do
      api.to_rfc2822(DateTime.parse('2012-03-12 00:00:00 +0000')).should eql rfc2822_date
    end
    it "retrieves the current time from the store" do
      api.connection.should_receive(:get).once.with("/time")
      api.get_time
    end
  end

  describe "Orders" do
    it "retrieves an order by ID" do
      api.connection.should_receive(:get).once.with("/orders/100")
      api.get_order(100)
    end

    it "retrieves orders" do
      api.connection.should_receive(:get).once.with("/orders", :params => {})
      api.get_orders
    end

    it "retrieves orders with pagination" do
      api.connection.should_receive(:get).once.with("/orders", :params => {:page => 2})
      api.get_orders(:page => 2)
    end

    it "retrieves orders with limit" do
      api.connection.should_receive(:get).once.with("/orders", :params => {:limit => 10})
      api.get_orders(:limit => 10)
    end

    it "retrieves orders with pagination and limit" do
      api.connection.should_receive(:get).once.with("/orders", :params => {:limit => 10, :page => 2})
      api.get_orders(:limit => 10, :page => 2)
    end

    it "converts from DateTime when retrieving orders by date" do
      api.connection.should_receive(:get).once.with("/orders", :params => {:min_date_created => CGI::escape(rfc2822_datetime)})
      api.get_orders_by_date(DateTime.parse('2012-03-13 12:45:26 GMT'))
    end

    it "converts from DateTime when retrieving orders by date with pagination" do
      api.connection.should_receive(:get).once.with("/orders", :params => {:min_date_created => CGI::escape(rfc2822_datetime), :page => 2})
      api.get_orders_by_date(DateTime.parse('2012-03-13 12:45:26 GMT'), :page => 2)
    end

    it "converts from Date when retrieving orders by date" do
      api.connection.should_receive(:get).once.with("/orders", :params => {:min_date_created => CGI::escape(rfc2822_date)})
      api.get_orders_by_date(Date.parse("2012-03-12"))
    end

    it "converts from a date-time string when retrieving orders by date" do
      api.connection.should_receive(:get).once.with("/orders", :params => {:min_date_created=> CGI::escape(rfc2822_datetime)})
      api.connection.should_receive(:get).once.with("/orders", :params => {:min_date_created=> CGI::escape(rfc2822_date)})

      api.get_orders_by_date('2012-03-13 12:45:26 GMT')
      api.get_orders_by_date('2012-03-12')
    end

    describe '#get_orders_modified_since' do
      it "retrieves orders modified since date-time" do
        api.connection.should_receive(:get).with('/orders', :headers => {'If-Modified-Since' => CGI::escape(rfc2822_datetime)})
        api.get_orders_modified_since(DateTime.parse(rfc2822_datetime))
      end
    end

    describe "Products" do
      describe '#create_product' do
        before { attributes.stub(:to_xml).with(:root => 'product') { 'product_xml' } }
        let(:attributes) { stub(:attributes) }
        it "creates product with passed attributes" do
          api.connection.should_receive(:post).with('/products', :body => 'product_xml')
          api.create_product(attributes)
        end
      end

      describe '#update_product' do
        before { attributes.stub(:to_xml).with(:root => 'product') { 'product_xml' } }
        let(:attributes) { stub(:attributes) }
        it "updates product with passed attributes" do
          api.connection.should_receive(:put).with('/products/123', :body => 'product_xml')
          api.update_product(123, attributes)
        end
      end
    end
  end
end
