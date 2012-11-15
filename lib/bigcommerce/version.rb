module Bigcommerce
  MAJOR = 0 unless defined? Bigcommerce::MAJOR
  MINOR = 0 unless defined? Bigcommerce::MINOR
  PATCH = 6 unless defined? Bigcommerce::PATCH
  VERSION = [MAJOR, MINOR, PATCH].join('.') unless defined? Bigcommerce::VERSION
end
