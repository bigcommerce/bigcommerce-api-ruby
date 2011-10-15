require "cgi"
require "uri"
require "net/https"

require "rubygems"
require "json"

require File.join(File.dirname(__FILE__), 'bigcommerce', 'api')
require File.join(File.dirname(__FILE__), 'bigcommerce', 'connection')

module BigCommerce
  VERSION = "0.0.5"
end