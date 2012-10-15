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

    def get_products(params={})
      @connection.get '/products'
    end

    def get_brands
      @connection.get '/brands'
    end

    def get_product(id)
      @connection.get '/products/' + id.to_s
    end

    def get_categories
      @connection.get '/categories'
    end

    def get_category(id)
      @connection.get '/categories/' + id.to_s
    end

    def get_orders(params={})
      @connection.get('/orders', :params => params)
    end

    def get_orders_by_date(date, params={})
      if date.is_a?(String)
        date = DateTime.parse(date)
      end
      date = to_rfc2822(date)
      @connection.get('/orders', :params => params.merge!(:min_date_created => CGI::escape(date)))
    end

    def get_orders_count
      get_count @connection.get '/orders/count'
    end

    def get_order(id)
      @connection.get '/orders/' + id.to_s
    end

    def get_order_products(id)
      @connection.get '/orders/' + id.to_s + '/products'
    end

    def get_orders_modified_since(datetime)
      @connection.get('/orders', :headers => {'If-Modified-Since' => CGI::escape(to_rfc2822(datetime))})
    end

    def get_customers(_filters = {})
      url_filters = _filters.map{|k,v| "#{k}=#{v}"}.join("&")
      @connection.get "/customers#{url_filters.present? ? ("?" + url_filters) : ""}"
    end

    def get_customer(id)
      @connection.get '/customers/' + id.to_s
    end

    def get_customer_count
      @connection.get '/customers/count'
    end

    def create_product(attributes)
      @connection.post('/products', :body => attributes.to_xml(:root => 'product'))
    end

    def update_product(id, attributes)
      @connection.put("/products/#{id}", :body => attributes.to_xml(:root => 'product'))
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