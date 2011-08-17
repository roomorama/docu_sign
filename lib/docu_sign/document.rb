module DocuSign
  class Document
    attr_accessor :tabs
    attr_accessor :id
    attr_accessor :name
    attr_accessor :pdf_bytes
    attr_accessor :password
    attr_accessor :transform_pdf_fields
    attr_accessor :file_extension
    attr_accessor :match_boxes
    attr_accessor :attachment_description
    attr_writer :tab_builder

    def initialize(id = nil, name = nil, pdf_bytes = nil, password = nil, transform_pdf_fields = nil, file_extension = nil, match_boxes = nil, attachment_description = nil)
      @id = id
      @name = name
      @pdf_bytes = pdf_bytes
      @password = password
      @transform_pdf_fields = transform_pdf_fields
      @file_extension = file_extension
      @match_boxes = match_boxes
      @attachment_description = attachment_description
    end

    def tabs(recipient = nil, &block)
      @tabs ||= DocuSign::ArrayOfTab.new

      return @tabs unless block_given?

      self.tab_builder = DocuSign::Builder::TabBuilder.new(self, recipient)

      @tabs.tap do |a|
        yield self if block_given?
      end
    end

    def tab(options = {}, &block)
      tab_builder.build(options, &block).tap do |t|
        tabs << t
      end
    end

    def tab_builder
      @tab_builder ||= DocuSign::Builder::TabBuilder.new(self)
    end
  end
end