module Bigcommerce
  class Api

  # Whitelist for resources, because we're only interested in some endpoints
  AvailableResources = ["brands", "categories", "countries", "coupons", "customer_groups", "customers", "options", "optionsets", "orders", "orderstatuses", "products", "redirects", "taxclasses"]

  attr_reader :resources
  # TODO, serialize and load @api_index & @results
  def initialize configuration={}
    @configuration = configuration
    @resources = {}
  end

  def headers
    {
      :head => {'authorization' => [@configuration[:username], @configuration[:api_key]], 'Accept' => 'application/json'}
    }
  end

  def base_url
    @configuration[:store_url] + '/api/v2/'
  end

  # This creates the resource class
  # The class name will be the resource name, in camel case, eg customer_groups -> CustomerGroups
  def create_resource_class name, endpoint
    # We need to get this inside the closure, because self means something different inside the Class.new block
    auth_headers = headers
    klass = Class.new do
      @auth_headers = auth_headers
      @name = name
      @endpoint = endpoint
      include Resource
    end
    Object.const_set(name.camelize, klass)
    @resources[name] = klass
  end


  # Query the API, and create resource classes for whatever we find
  def map
    # Create a class for each resource
    api_index.each do |resource|
      create_resource_class resource[0], resource[1]["url"]
    end

    # Fetch documentation
    api_docs.responses[:callback].each do |key, value|
      name = key.to_s
      data = JSON.parse value.response
      @resources[name].fields = data["fields"]
      @resources[name].filters = data["filters"]
    end
  end

  # Get a listing of all api endpoints
  def api_index
    @api_index ||= JSON.parse(EventMachine::HttpRequest.new(base_url).get(headers).response).select {|k,v| AvailableResources.include? k}
  end

  # Get data on each endpoint
  def api_docs
    if (!@api_docs)
      multi = EventMachine::Synchrony::Multi.new
      api_index.each do |key, value|
        multi.add key.to_sym, EventMachine::HttpRequest.new(value["url"]).aoptions(headers)
      end
      @api_docs = multi.perform
    end
    @api_docs
  end

  end

end
