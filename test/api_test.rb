require 'test_helper'

class ApiTest < Test::Unit::TestCase

  def setup
    @api = BigCommerce::Api.new({:store_url => "https://store-12345.mybigcommerce.com", :username => "test", :api_key => "12345"})
    FakeWeb.register_uri(:get, %r|https://test:12345@store-12345.mybigcommerce.com/api/v2/orders|, :body => load_fixture('order'), :status => 200, :content_type => "text/json")
    FakeWeb.register_uri(:get, %r|https://test:12345@store-12345.mybigcommerce.com/api/v2/time|, :body => load_fixture('time'), :status => 200, :content_type => "text/json")

    @rfc2822_datetime = "Tue, 13 Mar 2012 12:45:26 +0000"
    @rfc2822_date = "Mon, 12 Mar 2012 00:00:00 +0000"
  end

  def teardown
    FakeWeb.allow_net_connect = false
  end

  def test_to_rfc2822
    assert_equal @rfc2822_datetime, @api.to_rfc2822(DateTime.parse('2012-03-13 12:45:26 +0000'))
    assert_equal @rfc2822_date, @api.to_rfc2822(DateTime.parse('2012-03-12 00:00:00 +0000'))
  end

  def test_get_time
    @api.connection.expects(:get).with("/time")
    @api.get_time
  end

  def test_get_order
    @api.connection.expects(:get).with("/orders/100")
    @api.get_order(100)
  end

  def test_get_orders
    @api.connection.expects(:get).with("/orders", {})
    @api.get_orders
  end

  def test_get_orders_with_pagination
    @api.connection.expects(:get).with("/orders", {:page=>2})
    @api.get_orders(:page => 2)
  end

  def test_get_orders_with_limit
    @api.connection.expects(:get).with("/orders", {:limit => 10})
    @api.get_orders(:limit => 10)
  end

  def test_get_orders_with_pagination_and_limit
    @api.connection.expects(:get).with("/orders", {:limit=>10, :page=>2})
    @api.get_orders(:limit => 10, :page => 2)
  end

  def test_get_orders_by_date_with_pagination
    # RFC 2822 format is required
    @api.connection.expects(:get).with("/orders", {:min_date_created => CGI::escape(@rfc2822_datetime), :page => 2})

    # Test DateTime
    @api.get_orders_by_date(DateTime.parse('2012-03-13 12:45:26 GMT'), :page => 2)
  end

  def test_get_orders_by_date_with_date_time
    # RFC 2822 format is required
    @api.connection.expects(:get).with("/orders", {:min_date_created => CGI::escape(@rfc2822_datetime)})

    # Test DateTime
    @api.get_orders_by_date(DateTime.parse('2012-03-13 12:45:26 GMT'))
  end

  def test_get_orders_by_date_with_date
    # RFC 2822 format is required
    @api.connection.expects(:get).with("/orders", {:min_date_created => CGI::escape(@rfc2822_date)})

    # Test Date
    @api.get_orders_by_date(Date.parse("2012-03-12"))
  end

  def test_get_orders_by_date_with_string
    # RFC 2822 format is required
    @api.connection.expects(:get).with("/orders", {:min_date_created=> CGI::escape(@rfc2822_datetime)})
    @api.connection.expects(:get).with("/orders", {:min_date_created=> CGI::escape(@rfc2822_date)})

    # Test String
    @api.get_orders_by_date('2012-03-13 12:45:26 GMT')
    @api.get_orders_by_date('2012-03-12')
  end

end
