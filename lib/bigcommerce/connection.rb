module Bigcommerce
  class Connection

    def initialize(configuration)
      @configuration = {}
      configuration.each do |key, val|
        send(key.to_s + "=", val)
      end
    end

    def configuration
      @configuration
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

    def ssl_client_key=(path,passphrase=nil)
      if passphrase.nil?
        @configuration.ssl_client_key = OpenSSL::PKey::RSA.new(File.read(path))
      else
        @configuration.ssl_client_key = OpenSSL::PKey::RSA.new(File.read(path), passphrase)
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

    def request(method, path, options,headers={})
      restclient = RestClient::Resource.new "#{@configuration[:store_url]}/api/v2#{path}.json", @configuration[:username], @configuration[:api_key]
      if @configuration[:ssl_client_key] && @configuration[:ssl_client_cert] && @configuration[:ssl_ca_file]
        restclient = RestClient::Resource.new(
          "#{@configuration[:store_url]}/api/v2#{path}.json",
          :username => @configuration[:username], 
          :password => @configuration[:api_key],
          :ssl_client_cert  =>  @configuration[:ssl_client_cert],
          :ssl_client_key   =>  @configuration[:ssl_client_key],
          :ssl_ca_file      =>  @configuration[:ssl_ca_file],
          :verify_ssl       =>  @configuration[:verify_ssl]
        )
      end
      begin
        response = case method
                   when :get then
                     restclient.get :params => options, :accept => :json, :content_type => :json
                   when :post then
                     restclient.post(options.to_json, :content_type => :json, :accept => :json)
                   when :put then
                     restclient.put(options.to_json, :content_type => :json, :accept => :json)
                   when :delete then
                     restclient.delete
                   end
        if(response.code == 200)
          JSON.parse response
        elsif response.code == 204
          nil
        end
      rescue => e
        raise "Failed to parse Bigcommerce response: #{e}"
      end
    end
 
  end
end
