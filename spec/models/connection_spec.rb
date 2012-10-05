require 'spec_helper'

describe BigCommerce::Connection do
  let(:connection) do
    BigCommerce::Connection.new({
      :store_url => "https://store-12345.mybigcommerce.com",
      :username => "test",
      :api_key => "12345"
    })
  end

  describe "#get" do
    before do
      FakeWeb.allow_net_connect = false
      FakeWeb.register_uri(:get, %r|https://test:12345@store-12345.mybigcommerce.com/api/v2/orders|, :body => load_json_fixture('order'), :status => 200, :content_type => "text/json")
      FakeWeb.register_uri(:get, %r|https://test:12345@store-12345.mybigcommerce.com/api/v2/time|, :body => load_json_fixture('time'), :status => 200, :content_type => "text/json")
    end
    after do
      FakeWeb.clean_registry
    end

    it "sends requests with no params" do
      connection.should_receive(:request).once.with(:get, "/orders", nil, nil, {})
      connection.get("/orders")
    end

    it "sends requests with with params" do
      connection.should_receive(:request).once.with(:get, "/orders", nil, {:page => 3}, {})
      connection.get("/orders", {:page => 3})
    end

    it "sends requests with headers" do
      connection.should_receive(:request).once.with(:get, "/orders", nil, {:page => 3}, {'Some-Header' => 'abc'})
      connection.get("/orders", {:page => 3}, {'Some-Header' => 'abc'})
    end
  end

  describe "#hash_to_params" do
    # TODO: Consider using addressable gem; see <http://stackoverflow.com/a/803067/3528> for examples.
    it "converts flat hashes to query strings" do
      connection.hash_to_params({:a => 1, :b => 2}).should eql "a=1&b=2"
    end
    it "converts empty hashes to nil" do
      connection.hash_to_params({}).should be_nil
    end
    it "leaves nil as nil" do
      connection.hash_to_params(nil).should be_nil
    end
  end

  describe '#request' do
    context "when GET" do
      before do
        Net::HTTP::Get.stub(:new) { request }
        Net::HTTP.stub(:new) { stub.as_null_object }
      end
      let(:args) { [:get, path, body, params, headers] }
      let(:path) { '/orders' }
      let(:body) { nil }
      let(:params) { {} }
      let(:headers) { {} }
      let(:request) { stub.as_null_object }

      it "performs GET request to path with API prefix" do
        Net::HTTP::Get.should_receive(:new).with("/api/v2#{path}")
        connection.request(*args)
      end

      context "with querystring" do
        let(:params) { {:foo => 'bar'} }

        it "includes querystring" do
          Net::HTTP::Get.should_receive(:new).with("/api/v2#{path}?foo=bar")
          connection.request(*args)
        end
      end

      context "with custom header present" do
        let(:headers) { {'Some-Header' => 'abc'} }

        it "includes custom header" do
          request.should_receive(:add_field).with('Some-Header', 'abc')
          request.stub(:add_field) # ignoring other headers
          connection.request(*args)
        end
      end
    end
  end
end
