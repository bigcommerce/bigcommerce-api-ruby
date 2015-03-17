module Bigcommerce
  module Middleware
    class Auth < Faraday::Middleware
      def initialize(app, options = {})
        @app = app
        @options = options
      end

      def call(env)
        env[:request_headers]['X-Auth-Client'] = @options[:client_id]
        env[:request_headers]['X-Auth-Token'] = @options[:access_token]
        @app.call env
      end
    end
  end
end
