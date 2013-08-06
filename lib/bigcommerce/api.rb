module Bigcommerce
  class Api

    def initialize(configuration={})
      @connection = Connection.new(configuration)
    end

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

    def verify_ssl=(verify)
      @connection.verify_ssl = verify
    end

    def ca_file=(path)
      @connection.ca_file = path
    end

    def to_rfc2822(datetime)
      datetime.strftime("%a, %d %b %Y %H:%M:%S %z")
    end

    def get_time
      @connection.get '/time'
    end

    def get_brands(options={})
      @connection.get("/brands", options)
    end

    def get_brand(id)
      @connection.get("/brands/#{id}", {})
    end

    def create_brands(options={})
       @connection.post("/brands", options)
    end

    def update_brand(id, options={})
       @connection.put("/brands/#{id}", options)
    end

    def get_coupons(options={})
      @connection.get("/coupons", options)
    end

    def create_coupons(options={})
       @connection.post("/coupons", options)
    end

    def update_coupon(id, options={})
       @connection.put("/coupons/#{id}", options)
    end

    def get_categories(options={})
       @connection.get("/categories", options)
    end

    def get_categories_count
      @connection.get '/categories/count'
    end

    def get_category(id)
      @connection.get("/categories/#{id}", {})
    end

    def create_categories(options={})
       @connection.post("/categories", options)
    end

    def update_category(id, options={})
       @connection.put("/categories/#{id}", options)
    end

    def get_countries(options={})
      @connection.get("/countries", options)
    end

    def get_country(id)
      @connection.get("/countries/#{id}", {})
    end

    def get_countries_states(options={})
      @connection.get("/countries/states", options)
    end

    def get_countries_state(id, options={})
      @connection.get("/countries/#{id}/states", {})
    end

    def get_customers(options = {})
      @connection.get("/customers", options)
    end

    def get_customer(id)
      @connection.get('/customers/' + id.to_s, {})
    end

    def get_customer_addresses(id, options = {})
      @connection.get("/customers/#{id}/addresses", options)
    end

    def get_customer_address(customer_id, address_id)
      @connection.get("/customers/#{customer_id}/addresses/#{address_id}",{})
    end

    def get_options(options={})
       @connection.get("/options", options)
    end

    def get_option(id)
      @connection.get("/options/#{id}",{})
    end

    def create_option(options={})
      @connection.post("/options", options)
    end

    def update_option(id, options={})
      @connection.put("/options/#{id}", options)
    end

    def get_options_values(options={})
       @connection.get("/options/values", options)
    end

    def get_options_value(id)
      @connection.get("/options/#{id}/values",{})
    end

    def create_options_values(options_id, options={})
      @connection.post("/options/#{options_id}/values", options)
    end

    def update_options_value(options_id, values_id, options={})
      @connection.put("/options/#{options_id}/values/#{values_id}", options)
    end   

    def get_optionsets(options={})
       @connection.get("/optionsets", options)
    end

    def get_optionset(id)
      @connection.get("/optionsets/#{id}", {})
    end

    def create_optionset(options={})
      @connection.post("/optionsets", options)
    end

    def update_optionset(id, options={})
      @connection.put("/optionsets/#{id}", options)
    end

    def get_optionsets_options(options={})
       @connection.get("/optionsets/options", options)
    end

    def get_optionsets_option(id)
      @connection.get("/optionsets/options/#{id}", {})
    end

    def create_optionset_option(id, options={})
      @connection.post("/optionsets/#{id}/options", options)
    end

    def update_optionset_option(optionset_id, option_id, options={})
      @connection.put("/optionsets/#{optionset_id}/options/#{option_id}", options)
    end

    def get_orders(options={})
      @connection.get("/orders", options)
    end

    def get_orders_by_date(date, options={})
      if date.is_a?(String)
        date = DateTime.parse(date)
      end
      @connection.get('/orders', options.merge!(:min_date_created => to_rfc2822(date)))
    end

    def get_orders_modified_since(date)
      @connection.get('/orders', {}, {'If-Modified-Since' => to_rfc2822(date)})
    end

    def get_order(id)
      @connection.get("/orders/#{id}", {})
    end

    def update_order(id,options={})
      @connection.put("/orders/#{id}", options)
    end

    def get_orders_coupons(id)
      @connection.get("/orders/#{id}/coupons", {})
    end

    def get_orders_coupon(order_id,coupon_id)
      @connection.get("/orders/#{order_id}/coupons/#{coupon_id}", {})
    end

    def get_orders_products(id)
      @connection.get("/orders/#{id}/products", {})
    end

    def get_orders_product(order_id,product_id)
      @connection.get("/orders/#{order_id}/products/#{product_id}", {})
    end

    def get_orders_shipments(id)
      @connection.get("/orders/#{id}/shipments", {})
    end

    def create_orders_shipments(id)
      @connection.post("/orders/#{id}/shipments", {})
    end

    def get_orders_shipment(order_id,shipment_id)
      @connection.get("/orders/#{order_id}/shipments/#{shipment_id}", {})
    end

    def update_orders_shipment(order_id,shipment_id,options={})
      @connection.put("/orders/#{order_id}/shipments/#{shipment_id}", options)
    end

    def get_orders_shippingaddresses(id)
      @connection.get("/orders/#{id}/shippingaddresses", {})
    end

    def get_orders_shippingaddress(order_id,shippingaddress_id)
      @connection.get("/orders/#{order_id}/shippingaddresses/#{shippingaddress_id}", {})
    end

    def get_orderstatuses(options={})
      @connection.get("/orderstatuses", options)
    end

    def get_orderstatus(id)
      @connection.get("/orderstatuses/#{id}", {})
    end

    def get_products(options={})
      @connection.get("/products", options)
    end

    def get_products_count
      @connection.get '/products/count'
    end
    
    def get_product(id)
      @connection.get("/products/#{id}", {})
    end

     def create_products(options={})
      @connection.post('/products', options)
    end

    def update_products(id, options={})
      @connection.put("/products/#{id}", options)
    end
    
    def get_products_discountrules(options={})
      @connection.get("/products/discountrules", options)
    end

    def get_products_discountrule(product_id, discountrule_id)
      @connection.get("/products/#{product_id}/discountrules/#{discountrule_id}", {})
    end

    def get_products_configurablefields(options={})
      @connection.get("/products/configurablefields", options)
    end

    def get_products_configurablefield(product_id, configurable_field_id)
      @connection.get("/products/#{product_id}/configurablefields/#{configurable_field_id}", {})
    end

    def get_products_customfields(options={})
      @connection.get("/products/customfields", options)
    end

    def get_products_customfield(product_id, custom_field_id)
      @connection.get("/products/#{product_id}/customfields/#{custom_field_id}", {})
    end

    def get_product_images(product_id, options={})
      @connection.get("/products/#{product_id}/images", options)
    end
    
    def create_product_images(product_id, options={})
      @connection.post("/products/#{product_id}/images", options)
    end

    def get_products_images(options={})
      @connection.get("/products/images", options)
    end

    def create_products_images(options={})
      @connection.post("/products/images", options)
    end

    def get_products_image(product_id, image_id)
      @connection.get("/products/#{product_id}/images/#{image_id}", {})
    end

    def update_products_image(product_id,image_id,options={})
      @connection.put("/products/#{product_id}/images/#{image_id}", options)
    end

    def get_products_customfields(options={})
      @connection.get("/products/options", options)
    end

    def get_products_option(product_id,option_id)
      @connection.get("/products/#{product_id}/options/#{option_id}", {})
    end

    def get_products_rules(options={})
      @connection.get("/products/rules", options)
    end

    def create_products_rules(options={})
      @connection.post("/products/rules", options)
    end

    def get_products_rule(product_id,rule_id)
      @connection.get("/products/#{product_id}/rules/#{rule_id}", {})
    end

    def update_products_rule(product_id, rule_id, options={})
      @connection.put("/products/#{product_id}/rules/#{rule_id}", options)
    end

    def get_products_skus(options={})
      @connection.get("/products/skus", options)
    end

    def create_products_skus(options={})
      @connection.post("/products/skus", options)
    end

    def get_products_sku(product_id, sku_id)
      @connection.get("/products/#{product_id}/skus/#{sku_id}", {})
    end

    def update_products_sku(product_id, sku_id, options={})
      @connection.put("/products/#{product_id}/skus/#{sku_id}", options)
    end

    def get_products_videos(options={})
      @connection.get("/products/videos", options)
    end

    def get_products_video(product_id, video_id)
      @connection.get("/products/#{product_id}/videos/#{video_id}", {})
    end

    private

    def get_count(result)
      result["count"]
    end

    def get_resource(result)
      result
    end

    def get_collection(result)
      result
    end

  end
end
