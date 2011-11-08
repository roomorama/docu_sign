module DocuSign
  module Builder
    class DocumentBuilder < DocuSign::Builder::Base
      self.builder_class = DocuSign::Document

      def initialize()
        super
      end

      def build(options = {}, &block)

        super(options, &block).tap do |document|
        end
      end
    end
  end
end