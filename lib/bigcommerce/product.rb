module Bigcommerce
  class Product < Resource

    # Here we memoize brand, so we can re-use it across different products
    # Note we store this across the class
    def brand
      key = @hash["brand"]["resource"]
      @@some_method ||= {}
      @@some_method[key] ||= @connection.get(@hash["brand"]["resource"])
    end

  end
end
