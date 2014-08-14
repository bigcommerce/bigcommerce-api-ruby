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

describe "connection" do
  let(:ssl_opts) {
    {ssl_ca_file: File.join(Dir.pwd, "spec/support"),
     ssl_client_key: File.join(Dir.pwd, "spec/support", "testkey"),
     ssl_client_cert: File.join(Dir.pwd, "spec/support", "test.crt")}
  }

  let(:default_url) { "https://bunk.bigcommerce.com/" }
  let(:default_username) { "jane" }
  let(:default_api_key) { 'abc123' }
  let(:default_conf_options) { {store_url: default_url,
                                username: default_username,
                                api_key: default_api_key} }

  describe "#should_use_secure_client?" do
    it "returns true when ssl_client_key, ssl_client_cert & ssl_ca_file are all truthy" do
      conn = Bigcommerce::Connection.new(ssl_opts)
      expect(conn.should_use_secure_client?).to be_truthy
    end

    it "is false when one of the ssl_ keys are not supplied" do
      ssl_opts.keys.each do |key|
        test_hash = ssl_opts
        test_hash.delete(key)
        conn = Bigcommerce::Connection.new(test_hash)
        expect(conn.should_use_secure_client?).to be_falsey
      end
    end
  end

  describe "#restclient" do
    context "with secure" do
      it "creates a secure resetclient resourse" do
        conn = Bigcommerce::Connection.new(default_conf_options.merge(ssl_opts))
        expect(conn.restclient("/orders")).to be_kind_of RestClient::Resource
        expect(conn.restclient("/orders").options[:ssl_ca_file]).to_not be_nil
      end
    end

    context "without ssl" do
      it "creates a resetclient resourse" do
        conn = Bigcommerce::Connection.new(default_conf_options)
        expect(conn.restclient("/orders")).to be_kind_of RestClient::Resource
        expect(conn.restclient("/orders").options[:ssl_ca_file]).to be_nil
      end

    end
  end

  describe "#resource_options" do
    it "filters all the configuration keys to supply restclient with what it needs" do
      conn = Bigcommerce::Connection.new(default_conf_options.merge(ssl_opts))
      expect(conn.resource_options[:password]).to_not be_nil
      expect(conn.resource_options[:ssl_ca_file]).to_not be_nil

      conn = Bigcommerce::Connection.new(default_conf_options)
      expect(conn.resource_options[:ssl_ca_file]).to be_nil
      expect(conn.resource_options[:password]).to_not be_nil
    end

    it "adds keys as needed for resource_options" do
      conn = Bigcommerce::Connection.new(default_conf_options)
      ro = conn.resource_options(foo: 'bar')
      expect(ro[:password]).to_not be_nil
      expect(ro[:foo]).to_not be_nil
    end
  end
end
