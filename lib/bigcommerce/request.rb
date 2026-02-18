# frozen_string_literal: true

require 'json'
require 'stringio'
require 'zlib'

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
        decode_body(response.body, response.headers)
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
        response = client.send(method, path.to_s, params)
        return response unless response.respond_to?(:body) && response.respond_to?(:body=)

        response.body = decode_body(response.body, response.respond_to?(:headers) ? response.headers : {})
        response
      end

      private

      def build_response_object(response)
        json = parse(response.body, response.headers)
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
      def parse(json, headers = {})
        return [] if json.empty?

        JSON.parse(decode_body(json, headers), symbolize_names: true)
      end

      def decode_body(body, headers = {})
        payload = body.to_s.dup.force_encoding(Encoding::BINARY)
        return payload if payload.empty?

        content_encoding = headers['content-encoding'] || headers[:content_encoding]
        return payload unless content_encoding.to_s.downcase.include?('gzip') || payload.start_with?("\x1F\x8B".b)

        Zlib::GzipReader.new(StringIO.new(payload)).read
      rescue Zlib::Error
        payload
      end
    end
  end
end
