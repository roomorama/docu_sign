module DocuSign
  # {http://www.docusign.net/API/3.0}TabTypeCode
  class TabTypeCode < ::String
    Company = TabTypeCode.new("Company")
    Custom = TabTypeCode.new("Custom")
    DateSigned = TabTypeCode.new("DateSigned")
    EnvelopeID = TabTypeCode.new("EnvelopeID")
    FullName = TabTypeCode.new("FullName")
    InitialHere = TabTypeCode.new("InitialHere")
    InitialHereOptional = TabTypeCode.new("InitialHereOptional")
    SignHere = TabTypeCode.new("SignHere")
    SignHereOptional = TabTypeCode.new("SignHereOptional")
    SignerAttachment = TabTypeCode.new("SignerAttachment")
    Title = TabTypeCode.new("Title")
  end
end