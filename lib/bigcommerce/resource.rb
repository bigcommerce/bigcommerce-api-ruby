module Bigcommerce
  class Resource

    def metaclass
      class << self; self; end
    end

    def initialize hash, connection
      @connection = connection
      @hash = hash
      @hash.each do |key, value|
        if (value.class == Hash)
          self.resourceify(key, value)
        end
      end
      @full_hash = @hash
    end

    def [](key)
      @hash[key]
    end

    def []=(key,value)
      @hash[key] = value
    end

    def resourceify(name, data)
      if (!self.respond_to?(name.to_sym))
        self.metaclass.send(:define_method, name) do
          @connection.get data["resource"]
        end
      end
    end

    def load(*sub_resources)
      sub_resources.each do |sub_resource|
        begin
          @full_hash[sub_resource.to_s] = self.send(sub_resource)
        rescue RuntimeError => e
          puts e
        end
      end
    end

    def to_json
      @full_hash.to_json
    end

  end
end
