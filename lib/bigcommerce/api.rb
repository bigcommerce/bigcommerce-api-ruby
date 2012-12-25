module Bigcommerce
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

    def create_path(res,options)
      params  = options.map { |k,v| "#{k}=#{CGI.escape(v)}" }.join("&")
      path = res
      path   += "?#{params}" if not params.empty?
      return path
    end

    def get_time
      @connection.get '/time'
    end

    #brands

    def get_brands(options={})
      @connection.get create_path("/brands",options)
    end

    def get_brand(id)
      @connection.get create_path("/brands/#{id}",{})
    end

    #category

    def get_categories(options={})
       @connection.get create_path("/categories",options)
    end

    def get_category(id)
      @connection.get create_path("/categories/#{id}",{})
    end

    #country

    def get_countries(options={})
      @connection.get create_path("/countries",options)
    end

    def get_country(id)
      @connection.get create_path("/countries/#{id}",{})
    end

    #category

    def get_options(options={})
       @connection.get create_path("/options",options)
    end

    def get_option(id)
      @connection.get create_path("/options/#{id}",{})
    end

    #products

    def get_products(options={})
      @connection.get create_path("/products",options)
    end

    def get_product(id)
      @connection.get create_path("/products/#{id}",{})
    end

     def create_product(attributes)
      @connection.post('/products', :body => attributes.to_xml(:root => 'product'))
    end

    def update_product(id, attributes)
      @connection.put("/products/#{id}", :body => attributes.to_xml(:root => 'product'))
    end

   

    #order

    def get_orders(options={})
      @connection.get create_path("/orders",options)
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
      @connection.get create_path("/products/#{id}",{})
    end

    def get_order_products(id)
      @connection.get '/orders/' + id.to_s + '/products'
    end

    def get_orders_modified_since(datetime)
      @connection.get('/orders', :headers => {'If-Modified-Since' => CGI::escape(to_rfc2822(datetime))})
    end

    #customers

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
