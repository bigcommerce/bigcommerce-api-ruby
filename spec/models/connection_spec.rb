require 'spec_helper'

shared_examples_for "request method accepting optional params and headers" do
  it "sends request with no params" do
    connection.should_receive(:request).once.with(http_method, path, {})
    connection.send(http_method, path)
  end

  it "sends request with params" do
    connection.should_receive(:request).once.with(http_method, path, :params => {:page => 3})
    connection.send(http_method, path, :params => {:page => 3})
  end

  it "sends request with headers" do
    connection.should_receive(:request).once.with(http_method, "/orders", :headers =>  {'Some-Header' => 'abc'})
    connection.send(http_method, path, :headers => {'Some-Header' => 'abc'})
  end
end

describe BigCommerce::Connection do
  before { FakeWeb.allow_net_connect = false }
  after { FakeWeb.clean_registry }
  subject(:connection) do
    BigCommerce::Connection.new(
      :store_url => "https://store-12345.mybigcommerce.com",
      :username => "test",
      :api_key => "12345"
    )
  end

  [:get, :post, :put, :delete].each do |http_method|
    let(:path) { '/orders' }
    describe "##{http_method}" do
      eval "let(:http_method) { :#{http_method} }"
      it_behaves_like "request method accepting optional params and headers"
    end

    describe '#request' do
      context "when #{http_method.to_s.upcase} request" do
        before do
          http_class.stub(:new) { request }
          Net::HTTP.stub(:new) { stub.as_null_object }
        end
        let(:http_class) { eval "Net::HTTP::#{http_method.to_s.gsub(/^(.)/) { $1.upcase }}" }
        let(:args) { [http_method, path, options] }
        let(:body) { nil }
        let(:params) { {} }
        let(:headers) { {} }
        let(:options) { {:body => body, :params => params, :headers => headers}.reject { |k,v| v.nil? } }
        let(:request) { stub.as_null_object }

        it "requests path with API prefix" do
          http_class.should_receive(:new).with("/api/v2#{path}")
          connection.request(*args)
        end

        context "with querystring" do
          let(:params) { {:foo => 'bar'} }

          it "includes querystring" do
            http_class.should_receive(:new).with("/api/v2#{path}?foo=bar")
            connection.request(*args)
          end
        end

        context "with custom header" do
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
end
