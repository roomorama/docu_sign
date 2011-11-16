module DocuSign
  class Document < DocuSignModel
    ATTRIBUTES = [:tabs, :id, :name, :pdf_bytes, :password, :transform_pdf_fields, :file_extension, :match_boxes,
      :attachment_description]
    ATTRIBUTES.each do |attr|
      self.send(:attr_accessor, attr)
    end
    attr_writer :tab_builder

    def initialize(attributes = {})
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=", attributes[attr])
      end
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