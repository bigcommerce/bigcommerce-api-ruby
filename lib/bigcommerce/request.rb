# frozen_string_literal: true

require 'json'

module Bigcommerce
  class Request < Module
    def initialize(uri)
      @uri = uri
      super()
    end

    def included(base)
      base.extend ClassMethods
      path_builder = ::Bigcommerce::PathBuilder.new(@uri)
      base.define_singleton_method :path do
        path_builder
      end
    end

    module ClassMethods
      def get(path, params = {})
        response = raw_request(:get, path, params)
        build_response_object response
      end

      def delete(path, params = {})
        response = raw_request(:delete, path, params)
        response.body
      end

      def post(path, params = {})
        response = raw_request(:post, path, params)
        build_response_object response
      end

      def put(path, params = {})
        response = raw_request(:put, path, params)
        build_response_object response
      end

      def raw_request(method, path, params = {})
        client = params.delete(:connection) || Bigcommerce.api
        client.send(method, path.to_s, params)
      end

      private

      def build_response_object(response)
        json = parse response.body
        if json.is_a? Array
          json.map { |obj| new obj }
        else
          new json
        end
      end

      ##
      # @return [Hash]
      # @return [Array]
      #
      def parse(json)
        return [] if json.empty?

        JSON.parse(json, symbolize_names: true)
      end
    end
  end
end
