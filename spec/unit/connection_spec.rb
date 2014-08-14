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
end
