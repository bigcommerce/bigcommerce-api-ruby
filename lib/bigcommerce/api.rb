require 'date'
require 'ostruct'

module Bigcommerce
  class Api

    attr_reader :page

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

    def time
      @connection.get '/time'
    end

    def store_information
      @connection.get '/store'
    end

    def brands(options={})
      @connection.get("/brands", options)
    end

    def brands_count
      @connection.get '/brands/count'
    end

    def brand(id)
      @connection.get("/brands/#{id}", {})
    end

    def create_brands(options={})
       @connection.post("/brands", options)
    end

    def update_brand(id, options={})
       @connection.put("/brands/#{id}", options)
    end

    def delete_brand(id)
       @connection.delete("/brands/#{id}")
    end

    def coupons(options={})
      @connection.get("/coupons", options)
    end

    def create_coupons(options={})
       @connection.post("/coupons", options)
    end

    def update_coupon(id, options={})
       @connection.put("/coupons/#{id}", options)
    end

    def categories(options={})
       @connection.get("/categories", options)
    end

    def categories_count
      @connection.get '/categories/count'
    end

    def category(id)
      @connection.get("/categories/#{id}", {})
    end

    def create_categories(options={})
       @connection.post("/categories", options)
    end

    def update_category(id, options={})
       @connection.put("/categories/#{id}", options)
    end

    def delete_category(id)
       @connection.delete("/categories/#{id}")
    end

    def countries(options={})
      @connection.get("/countries", options)
    end

    def country(id)
      @connection.get("/countries/#{id}", {})
    end

    def countries_states(options={})
      @connection.get("/countries/states", options)
    end

    def countries_state(id, options={})
      @connection.get("/countries/#{id}/states", {})
    end

    def customers(options = {})
      @connection.get("/customers", options)
    end

    def customer(id)
      @connection.get('/customers/' + id.to_s, {})
    end

    def customer_addresses(id, options = {})
      @connection.get("/customers/#{id}/addresses", options)
    end

    def customer_address(customer_id, address_id)
      @connection.get("/customers/#{customer_id}/addresses/#{address_id}",{})
    end

    def options(options={})
       @connection.get("/options", options)
    end

    def options_count
       @connection.get '/options/count'
    end

    def option(id)
      @connection.get("/options/#{id}",{})
    end

    def create_option(options={})
      @connection.post("/options", options)
    end

    def update_option(id, options={})
      @connection.put("/options/#{id}", options)
    end

    def delete_option(id)
      @connection.delete("/options/#{id}")
    end

    def options_values(options={})
       @connection.get("/options/values", options)
    end

    def options_value(id, options={})
      @connection.get("/options/#{id}/values", options)
    end

    def create_options_values(options_id, options={})
      @connection.post("/options/#{options_id}/values", options)
    end

    def update_options_value(options_id, values_id, options={})
      @connection.put("/options/#{options_id}/values/#{values_id}", options)
    end

    def optionsets(options={})
       @connection.get("/optionsets", options)
    end

    def optionsets_count
       @connection.get '/optionsets/count'
    end

    def optionset(id)
      @connection.get("/optionsets/#{id}", {})
    end

    def create_optionset(options={})
      @connection.post("/optionsets", options)
    end

    def update_optionset(id, options={})
      @connection.put("/optionsets/#{id}", options)
    end

    def delete_optionset(id)
      @connection.delete("/optionsets/#{id}")
    end

    def optionsets_options(options={})
       @connection.get("/optionsets/options", options)
    end

    def optionset_options(id)
      @connection.get("/optionsets/#{id}/options", {})
    end

    def optionsets_option(id)
      @connection.get("/optionsets/options/#{id}", {})
    end

    def create_optionset_option(id, options={})
      @connection.post("/optionsets/#{id}/options", options)
    end

    def update_optionset_option(optionset_id, option_id, options={})
      @connection.put("/optionsets/#{optionset_id}/options/#{option_id}", options)
    end

    def orders(options={})
      @connection.get("/orders", options)
    end

    def orders_by_date(date, options={})
      if date.is_a?(String)
        date = DateTime.parse(date)
      end
      @connection.get('/orders', options.merge!(:min_date_created => to_rfc2822(date)))
    end

    def orders_modified_since(date)
      @connection.get('/orders', {}, {'If-Modified-Since' => to_rfc2822(date)})
    end

    def order(id,options={})
      @connection.get("/orders/#{id}", options)
    end

    def update_order(id,options={})
      @connection.put("/orders/#{id}", options)
    end

    def orders_count(options={})
        @connection.get("/orders/count", options)
    end
    
    def orders_coupons(id,options={})
      @connection.get("/orders/#{id}/coupons", options)
    end

    def orders_coupon(order_id,coupon_id,options={})
      @connection.get("/orders/#{order_id}/coupons/#{coupon_id}", options)
    end

    def orders_products(id,options={})
      @connection.get("/orders/#{id}/products", options)
    end

    def orders_product(order_id,product_id,options={})
      @connection.get("/orders/#{order_id}/products/#{product_id}", options)
    end

    def orders_shipments(id,options={})
      @connection.get("/orders/#{id}/shipments", options)
    end

    def create_orders_shipments(id, options={})
      @connection.post("/orders/#{id}/shipments", options)
    end

    def orders_shipment(order_id,shipment_id,options={})
      @connection.get("/orders/#{order_id}/shipments/#{shipment_id}", options)
    end

    def update_orders_shipment(order_id,shipment_id,options={})
      @connection.put("/orders/#{order_id}/shipments/#{shipment_id}", options)
    end

    def orders_shippingaddresses(id,options={})
      @connection.get("/orders/#{id}/shippingaddresses", options)
    end

    def orders_shippingaddress(order_id,shippingaddress_id,options={})
      @connection.get("/orders/#{order_id}/shippingaddresses/#{shippingaddress_id}", options)
    end

    def orderstatuses(options={})
      @connection.get("/orderstatuses", options)
    end

    def orderstatus(id,options={})
      @connection.get("/orderstatuses/#{id}", options)
    end

    def products(options={})
      @connection.get("/products", options)
    end

    def products_count(options={})
      @connection.get('/products/count', options)
    end

    def product(id,options={})
      @connection.get("/products/#{id}", options)
    end

    def create_products(options={})
      @connection.post('/products', options)
    end

    def update_products(id, options={})
      @connection.put("/products/#{id}", options)
    end

    def delete_products(id)
      @connection.delete("/products/#{id}")
    end

    def products_discountrules(options={})
      @connection.get("/products/discountrules", options)
    end

    def product_discountrules(product_id, options={})
      @connection.get("/products/#{product_id}/discountrules", options)
    end

    def products_discountrule(product_id, discountrule_id,options={})
      @connection.get("/products/#{product_id}/discountrules/#{discountrule_id}", options)
    end

    def products_configurablefields(options={})
      @connection.get("/products/configurablefields", options)
    end

    def product_configurablefields(product_id, options={})
      @connection.get("/products/#{product_id}/configurablefields", options)
    end

    def products_configurablefield(product_id, configurable_field_id, options={})
      @connection.get("/products/#{product_id}/configurablefields/#{configurable_field_id}", options)
    end

    def products_customfields(options={})
      @connection.get("/products/customfields", options)
    end

    def product_customfields(product_id, options={})
      @connection.get("/products/#{product_id}/customfields", options)
    end

    def create_product_customfield(product_id, options={})
      @connection.post("/products/#{product_id}/customfields", options)
    end

    def update_product_customfield(product_id, custom_field_id, options={})
      @connection.put("/products/#{product_id}/customfields/#{custom_field_id}", options)
    end

    def delete_product_customfield(product_id, custom_field_id)
      @connection.delete("/products/#{product_id}/customfields/#{custom_field_id}")
    end

    def delete_product_customfields(product_id)
      @connection.delete("/products/#{product_id}/customfields")
    end

    def products_customfield(product_id, custom_field_id, options={})
      @connection.get("/products/#{product_id}/customfields/#{custom_field_id}", options)
    end

    def product_images(product_id, options={})
      @connection.get("/products/#{product_id}/images", options)
    end

    def create_product_images(product_id, options={})
      @connection.post("/products/#{product_id}/images", options)
    end

    def create_products_images(options={})
      @connection.post("/products/images", options)
    end

    def products_image(product_id, image_id, options={})
      @connection.get("/products/#{product_id}/images/#{image_id}", options)
    end

    def update_products_image(product_id,image_id,options={})
      @connection.put("/products/#{product_id}/images/#{image_id}", options)
    end

    def product_options(product_id, options={})
      @connection.get("/products/#{product_id}/options", options)
    end

    def products_option(product_id,option_id, options={})
      @connection.get("/products/#{product_id}/options/#{option_id}", options)
    end

    def product_rules(product_id, options={})
      @connection.get("/products/#{product_id}/rules", options)
    end

    def create_products_rules(options={})
      @connection.post("/products/rules", options)
    end

    def products_rule(product_id,rule_id,options={})
      @connection.get("/products/#{product_id}/rules/#{rule_id}", options)
    end

    def update_products_rule(product_id, rule_id, options={})
      @connection.put("/products/#{product_id}/rules/#{rule_id}", options)
    end

    def product_skus(product_id, options={})
      @connection.get("/products/#{product_id}/skus", options)
    end

    def create_products_skus(options={})
      @connection.post("/products/skus", options)
    end

    def products_sku(product_id, sku_id, options={})
      @connection.get("/products/#{product_id}/skus/#{sku_id}", options)
    end

    def update_products_sku(product_id, sku_id, options={})
      @connection.put("/products/#{product_id}/skus/#{sku_id}", options)
    end

    def product_videos(product_id, options={})
      @connection.get("/products/#{product_id}/videos", options)
    end

    def products_video(product_id, video_id, options={})
      @connection.get("/products/#{product_id}/videos/#{video_id}", options)
    end

    def count(result)
      result["count"]
    end

    def collection(resource_path, options={})
      if (options["resource_class"])
        klass = options["resource_class"]
      else
        klass = Resource
      end
      Enumerator.new do |yielder|
        count = -1
        if options[:starting_page]
          @page = options[:starting_page]
        else
          @page = 1
        end
        until count == 0
          buffer = @connection.get(resource_path, {page: page})
          count = buffer.count
          buffer.each do |item|
            yielder << klass.new(item, @connection)
            p @connection.remaining_rate_limit
          end
          @page += 1
        end
      end
    end

    def resource(result)
      result
    end
  end
end
