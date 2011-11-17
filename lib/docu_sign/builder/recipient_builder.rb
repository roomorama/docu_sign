module DocuSign
  module Builder
    class RecipientBuilder < DocuSign::Builder::Base
      self.builder_class = DocuSign::Recipient

      def initialize()
        super
      end

      #def build(options = {}, &block)
      #
      #  super(options, &block).tap do |recipient|
      #  end
      #end
    end
  end
end