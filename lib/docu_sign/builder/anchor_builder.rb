module DocuSign
  module Builder
    class AnchorBuilder < DocuSign::Builder::Base
      self.builder_class = DocuSign::AnchorTab

      def initialize()
        super
      end

      def build(options = {}, &block)

        super(options, &block).tap do |anchor_tab|
        end
      end
    end
  end
end