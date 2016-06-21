require 'hashie'
require 'faraday_middleware'
require 'bigcommerce/version'
require 'bigcommerce/config'
require 'bigcommerce/connection'
require 'bigcommerce/middleware/auth'
require 'bigcommerce/middleware/http_exception'
require 'bigcommerce/resources/resource'

module Bigcommerce
  resources = File.join(File.dirname(__FILE__), 'bigcommerce', 'resources', '**', '*.rb')
  Dir.glob(resources, &method(:require))

  class << self
    attr_reader :api

    def configure
      @config = Bigcommerce::Config.new.tap { |h| yield(h) }
      @api = Bigcommerce::Connection.build(@config)
    end
  end
end
