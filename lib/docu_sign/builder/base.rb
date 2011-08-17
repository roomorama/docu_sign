module DocuSign
  module Builder
    class Base
      class << self
        attr_accessor :builder_class
      end

      attr_accessor :object

      def initialize(*args, &block); end

      def build(options = {}, &block)
        (self.object = builder_class.new).tap do |o|
          options.each do |key, value|
            o.send "#{key}=", value
          end

          yield o if block_given?
        end
      end

      def builder_class
        self.class.builder_class
      end
    end
  end
end