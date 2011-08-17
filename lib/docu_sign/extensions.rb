class Module
  def alias_attribute(new_name, old_name)
    module_eval <<-STR, __FILE__, __LINE__ + 1
      def #{new_name}; self.#{old_name}; end          # def subject; self.title; end
      def #{new_name}?; self.#{old_name}?; end        # def subject?; self.title?; end
      def #{new_name}=(v); self.#{old_name} = v; end  # def subject=(v); self.title = v; end
    STR
  end
end

# AutoCamelize
#
# This module enables a class to automatically map
# Ruby-esque snake_case method calls to the equivalent
# camelCase calls. If a method with a camelCase equivalent
# is found, we alias the snake_case method on the
# class, to avoid tripping method_missing for the same
# method in the future.
module ConstEnhancements
  def const_descendants
    constants.reject { |c| c == 'Enumerator' }.inject([]) do |collection, constant|
      c = const_get(constant)
      collection << c

      if [Module, Class].include?(c.class)
        collection + c.const_descendants
      else
        collection
      end
    end
  end
end

[Module, Class].each do |i|
  i.send :include, ConstEnhancements
end

module AutoCamelize
  def method_missing(method_name, *args, &block)
    ds_name = ds_equivalent(method_name)

    if ds_name && respond_to?(ds_name)
      self.class.class_eval %Q{
        def #{method_name}(*args, &block)
          send "#{ds_name}", *args, &block
        end
      }

      send method_name, *args, &block
    else
      super
    end
  end

  # Find the equivalent built-in method name, if there is one.
  # Example:
  # ds_equivalent('pdf_bytes') => 'pDFBytes'

  def ds_equivalent(string)
    string = string.to_s.camelize(:lower)
    methods.find { |m| m.downcase == string.downcase }
  end
end

module AutoQuery
  def method_missing(method_name, *args, &block)
    string_name = method_name.to_s

    if (string_name =~ /\?$/) && respond_to?(string_name.gsub(/\?/, ''))
      self.class.class_eval %Q{
        def #{string_name}(*args, &block)
          !! (send "#{string_name.gsub(/\?/, '')}", *args, &block)
        end
      }

      send method_name, *args, &block
    else
      super
    end
  end
end