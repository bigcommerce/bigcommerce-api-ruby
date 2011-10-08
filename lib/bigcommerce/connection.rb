module BigCommerce
	class Connection

		def initialize(configuration)
			@configuration = configuration
		end

		def get(path)
			request(:get, path)
		end

		def post(path)
			request(:post, path)
		end

		def put(path)
			request(:put, path)
		end

		def delete(path)
			request(:delete, path)
		end

		def request(method, path, body = nil, params = {})

			url = @configuration[:store_url] + '/api/v2' + path

			uri = URI.parse(url)

			http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

			request = case method
				when :get    then Net::HTTP::Get.new(uri.request_uri)
				when :post   then Net::HTTP::Post.new(uri.request_uri)
				when :put    then Net::HTTP::Put.new(uri.request_uri)
				when :delete then Net::HTTP::Delete.new(uri.request_uri)
			end

			request.basic_auth(@configuration[:username], @configuration[:api_key])
			request.add_field 'Accept', 'application/json'
			request.add_field 'Content-Type', 'application/json'

			response = http.request(request)

			return case response
    			when Net::HTTPSuccess, Net::HTTPRedirection
   			 		JSON.parse(response.body || "{}")
   			 	else false
    		end
		end

	end

	class HttpError < Exception

	end
end