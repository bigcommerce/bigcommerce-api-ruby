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
