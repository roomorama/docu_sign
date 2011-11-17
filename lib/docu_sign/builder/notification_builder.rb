module DocuSign
  module Builder
    class NotificationBuilder < DocuSign::Builder::Base
      self.builder_class = DocuSign::Notification

      def initialize()
        super
      end

      #def build(options = {}, &block)
      #  super(options, &block).tap do |notification|
      #  end
      #end
    end
  end
end