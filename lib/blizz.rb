class Blizz

  VERSION = "0.1"

  def self.load(klass, hash)
    page = klass.new
    page.load hash
    page
  end

  module Resource
    # DEFAULT_TYPE = "text"

    def klass
      self.class
    end

    def load(hash)
      klass.create_accessors hash
      load_contents hash
    end

    def self.included(mod)
      mod.send :extend, ClassMethods
    end

    module ClassMethods
      def create_accessors(hash)
        attr_accessor *hash.keys
      end

      def create_accessor(name)
        attr_accessor name
      end
    end

    private

    def load_contents(hash)
      hash.map do |key, val|
        if array_of_hashes? val
          val = replace_contents val
        end

        instance_variable_set "@#{key}", val
      end

      val = hash[:type]# || DEFAULT_TYPE
      Example.create_accessor :type
      instance_variable_set "@type", val
    end

    def array_of_hashes?(val)
      val.is_a?(Array) && val.first.is_a?(Hash)
    end

    def replace_contents(array)
      array.map do |hash|
        klass = Object.const_get hash[:type]
        Blizz.load klass, hash
      end
    end

  end

end