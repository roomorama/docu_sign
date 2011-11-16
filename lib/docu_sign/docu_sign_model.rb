module DocuSign
  class DocuSignModel
    ATTRIBUTES = []

    def initialize(attributes = {})
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=", attributes[attr])
      end
    end

    def to_savon
      {}
    end

    def method_missing(method, *args, &block)
      if method =~ /(.+)\?$/
        self.send($1).nil? ? nil : (self.send($1) == true ? "true" : "false")
      else
        super
      end
    end
  end
end