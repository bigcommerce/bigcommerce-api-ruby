require 'test_helper'

class ConnectionTest < Test::Unit::TestCase

  def setup
    FakeWeb.allow_net_connect = false
    @connection = BigCommerce::Connection.new({:store_url => "https://store-12345.mybigcommerce.com", :username => "test", :api_key => "12345"})

    FakeWeb.register_uri(:get, %r|https://test:12345@store-12345.mybigcommerce.com/api/v2/orders|, :body => load_fixture('order'), :status => 200, :content_type => "text/json")

    FakeWeb.register_uri(:get, %r|https://test:12345@store-12345.mybigcommerce.com/api/v2/time|, :body => load_fixture('time'), :status => 200, :content_type => "text/json")

  end

  def teardown
    FakeWeb.allow_net_connect = false
  end

  def test_get_no_params
    @connection.expects(:request).with(:get, "/orders", nil, nil)
    @connection.get("/orders")
  end

  def test_get_with_params
    @connection.expects(:request).with(:get, "/orders", nil, {:page => 3})
    @connection.get("/orders", {:page => 3})
  end

  def test_hash_to_params
    result = @connection.hash_to_params({:a => 1, :b => 2})
    assert_equal "a=1&b=2", result
  end

  def test_hash_to_params_empty
    result = @connection.hash_to_params({})
    assert_equal nil, result
  end

  def test_hash_to_params_nil
    result = @connection.hash_to_params(nil)
    assert_equal nil, result
  end

end
