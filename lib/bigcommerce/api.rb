module BigCommerce
  class Api

    def initialize(configuration={})
      @connection = Connection.new(configuration)
    end

    # Added getter to ensure configuration is correct
    def connection
      @connection
    end

    def store_url=(store_url)
      @connection.store_url = store_url
    end

    def username=(username)
      @connection.username = username
    end

    def api_key=(api_key)
      @connection.api_key = api_key
    end

    def verify_peer=(verify)
      @connection.verify_peer = verify
    end

    def ca_file=(path)
      @connection.ca_file = path
    end

    # Returns the date formatted as
    # RFC 2822 string
    def to_rfc2822(datetime)
      datetime.strftime("%a, %d %b %Y %H:%M:%S %z")
    end

    def get_time
      @connection.get '/time'
    end

    def get_products
      @connection.get '/products'
    end

    def get_product(id)
      @connection.get '/products/' + id
    end

    def get_categories
      @connection.get '/categories'
    end

    def get_category(id)
      @connection.get '/categories/' + id
    end

    def get_orders
      @connection.get('/orders')
    end

    def get_orders_by_date(date)
      if date.is_a?(String)
        date = DateTime.parse(date)
      end
      date = to_rfc2822(date)
      @connection.get '/orders?min_date_created=' + CGI::escape(date)
    end

    def get_orders_count
      get_count @connection.get '/orders/count'
    end

    def get_order(id)
      @connection.get '/orders/' + id
    end

    def get_order_products(id)
      @connection.get '/orders/' + id + '/products'
    end

    def get_customers
      @connection.get '/customers'
    end

    def get_customer(id)
      @connection.get '/customers/' + id
    end

    private

    def get_count(result)
      result["count"]
    end

    def get_resource(result)

    end

    def get_collection(result)

    end

  end
end