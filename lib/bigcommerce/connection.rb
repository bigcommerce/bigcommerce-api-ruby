module Bigcommerce
  class Connection
    attr_reader :configuration, :remaining_rate_limit

    def initialize(configuration)
      @configuration = {}
      configuration.each do |key, val|
        public_send(key.to_s + "=", val)
      end
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
      @configuration[:ssl_ca_file] = path
    end

    def ssl_client_key=(path,passphrase=nil)
      if passphrase.nil?
        @configuration[:ssl_client_key] = OpenSSL::PKey::RSA.new(File.read(path))
      else
        @configuration[:ssl_client_key] = OpenSSL::PKey::RSA.new(File.read(path), passphrase)
      end
    end

    def ssl_client_cert=(path)
      @configuration[:ssl_client_cert] = OpenSSL::X509::Certificate.new(File.read(path))
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
      response = case method
                 when :get then
                   restclient(path, {headers: headers}).get(:params => options,
                                                 :accept => :json,
                                                 :content_type => :json) { |response, request, result, &block|
                     result.body = response
                     headers = response.headers
                     result
                   }
                 when :post then
                   restclient(path, {headers: headers}).post(options.to_json,
                                                             :content_type => :json,
                                                             :accept => :json) { |response, request, result, &block|
                     result.body = response
                     headers = response.headers
                     result
                   }

                 when :put then
                   restclient(path, {headers: headers}).put(options.to_json,
                                                            :content_type => :json,
                                                            :accept => :json) { |response, request, result, &block|
                     result.body = response
                     headers = response.headers
                     result
                   }

                 when :delete then
                   restclient(path, {headers: headers}).delete { |response, request, result, &block|
                     result.body = response
                     headers = response.headers
                     result
                   }

                 else
                   fail NotImplementedError, "#{method} is not a supported method"
                 end

        if((200..201) === response.code.to_i)
          @remaining_rate_limit = headers[:x_bc_apilimit_remaining]
          json = JSON.parse(response.body)
        elsif response.code.to_i == 204
          @remaining_rate_limit = headers[:x_bc_apilimit_remaining]
          {}
        else
          json = JSON.parse(response.body)
          json.first if json
        end
    end

    def restclient(path, options={})
      RestClient::Resource.new "#{@configuration[:store_url]}/api/v2#{path}.json", resource_options(options)
    end

    def resource_options(additional_options={})
      {
          :user => @configuration[:username],
          :username => @configuration[:username],
          :password => @configuration[:api_key],
          :ssl_client_cert  =>  @configuration[:ssl_client_cert],
          :ssl_client_key   =>  @configuration[:ssl_client_key],
          :ssl_ca_file      =>  @configuration[:ssl_ca_file],
          :verify_ssl       =>  @configuration[:verify_ssl]
      }.merge(additional_options)
    end

    def should_use_secure_client?
      @configuration.has_key?(:ssl_client_key) &&
        @configuration.has_key?(:ssl_client_cert) &&
        @configuration.has_key?(:ssl_ca_file)
    end
  end
end
