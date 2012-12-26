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

    def get_time
      @connection.get '/time'
    end

    #brands

    def get_brands(options={})
      @connection.get("/brands",options)
    end

    def get_brand(id)
      @connection.get("/brands/#{id}",{})
    end

    def create_brands(options={})
       @connection.post("/categories",options)
    end

    #category

    def get_categories(options={})
       @connection.get("/categories",options)
    end

    def get_category(id)
      @connection.get("/categories/#{id}",{})
    end

    def create_categories(options={})
       @connection.post("/categories",options)
    end

    #country

    def get_countries(options={})
      @connection.get("/countries",options)
    end

    def get_country(id)
      @connection.get("/countries/#{id}",{})
    end

    #category

    def get_options(options={})
       @connection.get("/options",options)
    end

    def get_option(id)
      @connection.get("/options/#{id}",{})
    end

    #products

    def get_products(options={})
      @connection.get("/products",options)
    end

    def get_product(id)
      @connection.get("/products/#{id}",{})
    end

     def create_products(options={})
      @connection.post('/products', options)
    end

    def update_products(id, options={})
      @connection.put("/products/#{id}", options)
    end

    #options
    def get_options(options={})
      @connection.get("/options",options)
    end

    def create_options(options={})
      @connection.post("/options",options)
    end

    #order

    def get_orders(options={})
      @connection.get("/orders",options)
    end

    def get_orders_count
      get_count @connection.get '/orders/count'
    end

    def get_order(id)
      @connection.get("/products/#{id}",{})
    end

    def get_order_products(id)
      @connection.get('/orders/' + id.to_s + '/products',{})
    end


    #customers

    def get_customers(options = {})
      @connection.get("/customers",options)
    end

    def get_customer(id)
      @connection.get('/customers/' + id.to_s,{})
    end

    def get_customer_count
      @connection.get('/customers/count',{})
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
