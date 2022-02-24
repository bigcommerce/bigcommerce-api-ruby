# frozen_string_literal: true

require 'hashie'
require 'faraday_middleware'
require_relative 'bigcommerce/version'
require_relative 'bigcommerce/config'
require_relative 'bigcommerce/connection'
require_relative 'bigcommerce/path_builder'
require_relative 'bigcommerce/middleware/auth'
require_relative 'bigcommerce/middleware/http_exception'
require_relative 'bigcommerce/resources/resource'

module Bigcommerce
  resources = File.join(File.dirname(__FILE__), 'bigcommerce', 'resources', '**', '*.rb')
  Dir.glob(resources).sort.each { |r| require r }

  class << self
    # @!attribute [r] api
    #   @return [::Faraday::Connection]
    attr_reader :api
    # @!attribute [r] config
    #   @return [::Bigcommerce::Config]
    attr_reader :config

    def configure(&block)
      @config = Bigcommerce::Config.new.tap(&block)
      @api = Bigcommerce::Connection.build(@config)
    end
  end
end
