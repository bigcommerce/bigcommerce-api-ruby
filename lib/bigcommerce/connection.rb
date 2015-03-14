module Bigcommerce
  class Connection
    attr_reader :configuration, :remaining_rate_limit

    def initialize(configuration)
      @configuration = {}
      configuration.each do |key, val|
        send(key.to_s + "=", val)
      end
    end

    def store_hash=(store_hash)
      @configuration[:store_hash] = store_hash
    end

    def client_id=(client_id)
      @configuration[:client_id] = client_id
    end

    def access_token=(access_token)
      @configuration[:access_token] = access_token
    end

    def store_url=(store_url)
      url = URI.parse(store_url)
      @configuration[:store_url] = url.scheme + "://" + url.host
    end

    def username=(username)
      @configuration[:username] = username
    end

    def api_key=(api_key)
      @configuration[:api_key] = api_key
    end

    def verify_peer=(verify)
      @configuration[:verify_ssl] = verify
    end

    def ssl_ca_file=(path)
      @configuration.ssl_ca_file = path
    end

    def ssl_client_key=(options)
      if options[:passphrase].nil?
        @configuration.ssl_client_key = OpenSSL::PKey::RSA.new(File.read(options[:path]))
      else
        @configuration.ssl_client_key = OpenSSL::PKey::RSA.new(File.read(options[:path]), options[:passphrase])
      end
    end

    def ssl_client_cert=(path)
      @configuration.client_cert = OpenSSL::X509::Certificate.new(File.read(path))
    end

    def get(path, options = {}, headers = {})
      request(:get, path, options, headers)
    end

    def post(path, options = {}, headers = {})
      request(:post, path, options, headers)
    end

    def put(path, options = {}, headers = {})
      request(:put, path, options, headers)
    end

    def delete(path, options = {}, headers = {})
      request(:delete, path, options, headers)
    end

    # Make a request to the bigcommerce API using either Legacy or OAuth
    def request(method, path, options,headers={})
      if oauth?
        request_oauth(method, path, options, headers)
      else
        request_legacy(method, path, options, headers)
      end
    end

    private

    def oauth?
      @configuration[:store_hash] && @configuration[:client_id] && @configuration[:access_token]
    end

    def request_oauth(method, path, options, headers={})
      uri = File.join((ENV['BC_API_ENDPOINT'] || 'https://api.bigcommerce.com'), '/stores', @configuration[:store_hash], '/v2', path)

      rest_client = RestClient::Resource.new uri.to_s, {
        headers: headers.merge({
          'X-Auth-Client' => @configuration[:client_id],
          'X-Auth-Token' => @configuration[:access_token],
          :accept => :json,
          :content_type => :json
        })
      }

      response = case method
        when :get then
          rest_client.get :params => options
        when :post then
          rest_client.post(options.to_json)
        when :put then
          rest_client.put(options.to_json)
        when :delete then
          rest_client.delete
        when :head then
          rest_client.head
        when :options then
          rest_client.options
        else
          raise 'Unsupported method!'
      end

      if (200..201) === response.code
        JSON.parse response
      elsif response.code == 204
        {}
      end
    end

    def request_legacy(method, path, options, headers={})
      resource_options = {
          :user => @configuration[:username],
          :password => @configuration[:api_key],
          :headers => headers
      }

      rest_client = RestClient::Resource.new "#{@configuration[:store_url]}/api/v2#{path}.json", resource_options

      if @configuration[:ssl_client_key] && @configuration[:ssl_client_cert] && @configuration[:ssl_ca_file]
        rest_client = RestClient::Resource.new(
            "#{@configuration[:store_url]}/api/v2#{path}.json",
            :username => @configuration[:username],
            :password => @configuration[:api_key],
            :ssl_client_cert => @configuration[:ssl_client_cert],
            :ssl_client_key => @configuration[:ssl_client_key],
            :ssl_ca_file => @configuration[:ssl_ca_file],
            :verify_ssl => @configuration[:verify_ssl]
        )
      end

      response = case method
        when :get then
          rest_client.get :params => options, :accept => :json, :content_type => :json
        when :post then
          rest_client.post(options.to_json, :content_type => :json, :accept => :json)
        when :put then
          rest_client.put(options.to_json, :content_type => :json, :accept => :json)
        when :delete then
          rest_client.delete
        when :head then
          rest_client.head
        when :options then
          rest_client.options
        else
          raise 'Unsupported method!'
      end

      @remaining_rate_limit = response.headers[:x_bc_apilimit_remaining]
      if (200..201) === response.code
        JSON.parse response
      elsif response.code == 204
        {}
      end
    end

  end
end
