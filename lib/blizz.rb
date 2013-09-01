class Blizz

  VERSION = "0.2"

  def self.load(klass, hash, selection=nil)
    page = klass.new
    page.load hash, selection
    page
  end

  module Resource

    def klass
      self.class
    end

    def load(hash, selection)
      klass.create_accessors hash
      load_contents hash, selection
    end

    def self.included(mod)
      mod.send :extend, ClassMethods
    end

    module ClassMethods
      def create_accessors(hash)
        attr_accessor *hash.keys
      end
    end

    private

    def load_contents(hash, selection)
      hash.map do |key, val|
        next if selection && !selection.include?(key.to_sym)

        if array_of_hashes? val
          val = replace_contents val
        end

        instance_variable_set "@#{key}", val
      end
    end

    def array_of_hashes?(val)
      val.is_a?(Array) && val.first.is_a?(Hash)
    end

    def replace_contents(array)
      array.map do |hash|
        if hash[:type]
          klass = Object.const_get hash[:type]
          Blizz.load klass, hash
        else
          hash
        end
      end
    end

  end

end