# frozen_string_literal: true

module Bigcommerce
  class PathBuilder
    # @!attribute [r] uri
    #   @return [String] The URI of the path to build
    attr_reader :uri

    ##
    # @param [String] uri
    #
    def initialize(uri)
      @uri = uri
    end

    ##
    # This takes the @uri and inserts the keys to form a path.
    # To start we make sure that for nil/numeric values, we wrap those into an
    # array. We then scan the string for %d and %s to find the number of times
    # we possibly need to insert keys into the URI. Next, we check the size of
    # the keys array, if the keys size is less than the number of possible keys
    # in the URI, we will remove the trailing %d or %s, then remove the
    # trailing /. We then pass the keys into the uri to form the path.
    # ex. foo/%d/bar/%d => foo/1/bar/2
    #
    # @param [Array] keys
    # @return [String]
    #
    def build(keys = [])
      keys = [] if keys.nil?
      keys = [keys] if keys.is_a? Numeric
      ids = uri.scan('%d').count + uri.scan('%s').count
      str = ids > keys.size ? uri.chomp('%d').chomp('%s').chomp('/') : uri
      (str % keys).chomp('/')
    end

    ##
    # @return [String]
    #
    def to_s
      @uri
    end
  end
end
