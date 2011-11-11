module DocuSign
  class Document < DocuSignModel
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

    def initialize(attributes = {})
      @id = attributes[:id]
      @name = attributes[:name]
      @pdf_bytes = attributes[:pdf_bytes]
      @password = attributes[:password]
      @transform_pdf_fields = attributes[:transform_pdf_fields]
      @file_extension = attributes[:file_extension]
      @match_boxes = attributes[:match_boxes]
      @attachment_description = attributes[:attachment_description]
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

    def to_savon
      {"Document" => {
        "ID" => self.id,
        "Name" => self.name,
        "PDFBytes" => self.pdf_bytes,
        "Password" => self.password,
        "TransformPdfFields" => self.transform_pdf_fields,
        "FileExtension" => self.file_extension,
        "MatchBoxes" => self.match_boxes,
        "AttachmentDescription" => self.attachment_description
      }.delete_if{|key, value| value.nil?}}
    end
  end
end

# {http://www.docusign.net/API/3.0}ArrayOfDocument
module DocuSign
  class ArrayOfDocument < ::Array
  end
end