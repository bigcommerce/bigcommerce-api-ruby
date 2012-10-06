module BigCommerce
  class Connection

    def initialize(configuration)
      @configuration = configuration
    end

    def store_url=(store_url)
      @configuration[:store_url] = store_url
    end

    def username=(username)
      @configuration[:username] = username
    end

    def api_key=(api_key)
      @configuration[:api_key] = api_key
    end

    def verify_peer=(verify)
      @configuration[:verify_peer] = verify
    end

    def ca_file=(path)
      @configuration.ca_file = path
    end

    def get(path, params=nil, headers = {})
      request(:get, path, nil, params, headers)
    end

    def post(path, params=nil, headers = {})
      request(:post, path, nil, params, headers)
    end

    def put(path, params=nil, headers = {})
      request(:put, path, nil, params, headers)
    end

    def delete(path, params=nil, headers = {})
      request(:delete, path, nil, params, headers)
    end

    def request(method, path, body = nil, params = {}, headers = {})
      url = @configuration[:store_url] + '/api/v2' + path
      param_string = hash_to_params(params) unless params.nil? || params.empty?

      unless (param_string.nil? || param_string.empty?)
        uri = URI.parse("#{url}?#{param_string}")
      else
        uri = URI.parse(url)
      end

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      if @configuration.has_key?(:verify_peer) && @configuration[:verify_peer]
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      else
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      http.ca_file = @configuration[:ca_path] if @configuration.has_key?(:ca_path)

      request = case method
                  when :get then
                    Net::HTTP::Get.new(uri.request_uri)
                  when :post then
                    Net::HTTP::Post.new(uri.request_uri)
                  when :put then
                    Net::HTTP::Put.new(uri.request_uri)
                  when :delete then
                    Net::HTTP::Delete.new(uri.request_uri)
                end

      request.basic_auth(@configuration[:username], @configuration[:api_key])
      request.add_field 'Accept', 'application/json'
      request.add_field 'Content-Type', 'application/json'
      headers.each { |k,v| request.add_field(k, v) }

      response = http.request(request)

      return case response
               when Net::HTTPSuccess, Net::HTTPRedirection
                 JSON.parse(response.body || "{}")
               else
                 false
             end
    end

    def hash_to_params(hash)
      return nil if hash.nil? || hash.empty?

      # convert the hash to URL params
      return hash.map {|pair| pair.join("=")}.join("&")


    end
  end


  class HttpError < Exception

  end
end