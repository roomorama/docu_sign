module DocuSign

  class DocumentStatus < DocuSignModel
    ATTRIBUTES = [:id, :name, :template_name, :sequence]
    ATTRIBUTES.each do |attr|
      self.send(:attr_accessor, attr)
    end

    def initialize(attributes = {})
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=", attributes[attr])
      end
    end
  end
end