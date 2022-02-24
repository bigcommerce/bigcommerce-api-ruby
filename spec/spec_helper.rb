# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require_relative 'simplecov_helper'
require 'rspec'
require 'bigcommerce'

Dir["#{File.join(File.dirname(__FILE__), 'support')}/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.allow_message_expectations_on_nil = true
  end
  config.color = true
end
