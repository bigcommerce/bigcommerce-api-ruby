require 'spec_helper'

shared_examples_for "request method accepting optional params and headers" do
  it "sends request with no params" do
    connection.should_receive(:request).once.with(http_method, path, {}, {})
    connection.send(http_method, path)
  end

  it "sends request with params" do
    connection.should_receive(:request).once.with(http_method, path, {:page => 3}, {})
    connection.send(http_method, path, {:page => 3})
  end

  it "sends request with headers" do
    connection.should_receive(:request).once.with(http_method, "/orders", {}, {'Some-Header' => 'abc'})
    connection.send(http_method, path, {}, {'Some-Header' => 'abc'})
  end
  
  it "sends request with params and headers" do
    connection.should_receive(:request).once.with(http_method, "/orders", {:page => 6}, {'Some-Header' => 'abc'})
    connection.send(http_method, path, {:page => 6}, {'Some-Header' => 'abc'})
  end
end

describe Bigcommerce::Connection do
  describe "#request" do
    let(:configuration) { { :username => "test", :api_key => "12345", :store_url => "http://a.bigcommerce.com" } }
    let(:connection) { Bigcommerce::Connection.new(configuration) }
    let(:expected_url) { "#{configuration[:store_url]}/api/v2/orders.json" }
    let(:expected_params) { { :user => "test", :password => "12345", :headers => {} } }
    let(:mock_resource) { double("RestClient::Resource") }
    let(:mock_response) { double }
    let(:path) { "/orders" }

    before do
      mock_response.stub(:code).and_return(204)
      mock_resource.stub(:get).and_return(mock_response)
    end

    it "should set up the expected url, user and password" do
      RestClient::Resource.should_receive(:new).once.with(expected_url, expected_params).and_return(mock_resource)
      connection.request(:get, path, {})
    end

    it "should pass through headers to RestClient::Resource" do
      params_with_headers = expected_params.merge(:headers => {"Some-Header" => "abc"})
      RestClient::Resource.should_receive(:new).once.with(expected_url, params_with_headers).and_return(mock_resource)

      connection.request(:get, "/orders", {}, {"Some-Header" => "abc"})
    end
  end
end
