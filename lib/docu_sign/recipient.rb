# {http://www.docusign.net/API/3.0}Recipient
#   iD - SOAP::SOAPPositiveInteger
#   userName - SOAP::SOAPString
#   signerName - SOAP::SOAPString
#   email - SOAP::SOAPString
#   type - Docusign::RecipientTypeCode
#   accessCode - SOAP::SOAPString
#   addAccessCodeToEmail - SOAP::SOAPBoolean
#   requireIDLookup - SOAP::SOAPBoolean
#   iDCheckConfigurationName - SOAP::SOAPString
#   phoneAuthentication - Docusign::RecipientPhoneAuthentication
#   signatureInfo - Docusign::RecipientSignatureInfo
#   captiveInfo - Docusign::RecipientCaptiveInfo
#   customFields - Docusign::ArrayOfString1
#   routingOrder - SOAP::SOAPUnsignedShort
#   iDCheckInformationInput - Docusign::IDCheckInformationInput
#   autoNavigation - SOAP::SOAPBoolean
#   recipientAttachment - Docusign::ArrayOfAttachment
#   note - SOAP::SOAPString
#   roleName - SOAP::SOAPString
#   templateLocked - SOAP::SOAPBoolean
#   templateRequired - SOAP::SOAPBoolean
#   templateAccessCodeRequired - SOAP::SOAPBoolean
#   defaultRecipient - SOAP::SOAPBoolean
class Recipient
  attr_accessor :id
  attr_accessor :user_name
  attr_accessor :signer_name
  attr_accessor :email
  attr_accessor :type
  attr_accessor :access_code
  attr_accessor :add_access_code_to_email
  attr_accessor :require_id_lookup
  attr_accessor :id_check_configuration_name
  attr_accessor :phone_authentication
  attr_accessor :signature_info
  attr_accessor :captive_info
  attr_accessor :custom_fields
  attr_accessor :routing_order
  attr_accessor :id_check_information_input
  attr_accessor :auto_navigation
  attr_accessor :recipient_attachment
  attr_accessor :note
  attr_accessor :role_name
  attr_accessor :template_locked
  attr_accessor :template_required
  attr_accessor :template_access_code_required
  attr_accessor :default_recipient

  def initialize(id = nil, user_name = nil, signer_name = nil, email = nil, type = nil,
        access_code = nil, add_access_code_to_email = nil, require_id_lookup = nil,
        id_check_configuration_name = nil, phone_authentication = nil, signature_info = nil,
        captive_info = nil, custom_fields = nil, routing_order = nil, id_check_information_input = nil,
        auto_navigation = nil, recipient_attachment = nil, note = nil, role_name = nil, template_locked = nil,
        template_required = nil, template_access_code_required = nil, default_recipient = nil)
    @id = id
    @user_name = user_name
    @signer_name = signer_name
    @email = email
    @type = type
    @access_code = access_code
    @add_access_code_to_email = add_access_code_to_email
    @require_id_lookup = require_id_lookup
    @id_check_configuration_name = id_check_configuration_name
    @phone_authentication = phone_authentication
    @signature_info = signature_info
    @captive_info = captive_info
    @custom_fields = custom_fields
    @routing_order = routing_order
    @id_check_information_input = id_check_information_input
    @auto_navigation = auto_navigation
    @recipient_attachment = recipient_attachment
    @note = note
    @role_name = role_name
    @template_locked = template_locked
    @template_required = template_required
    @template_access_code_required = template_access_code_required
    @default_recipient = default_recipient
  end
end

# {http://www.docusign.net/API/3.0}ArrayOfRecipient
class ArrayOfRecipient < ::Array
end