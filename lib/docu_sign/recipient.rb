module DocuSign
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
  class Recipient < DocuSignModel
    attr_accessor :id
    attr_accessor :user_name
    attr_accessor :signer_name
    attr_accessor :email
    attr_accessor :type
    attr_accessor :access_code
    attr_accessor :add_access_code_to_email
    attr_accessor :require_id_lookup
    attr_accessor :id_check_configuration_name
    attr_accessor :live_id_recipient_authentication
    attr_accessor :facebook_recipient_authentication
    attr_accessor :linkedin_recipient_authentication
    attr_accessor :google_recipient_authentication
    attr_accessor :salesforce_recipient_authentication
    attr_accessor :twitter_recipient_authentication
    attr_accessor :yahoo_recipient_authentication
    attr_accessor :open_id_recipient_authentication
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

    def initialize(attributes = {})
      @id = attributes[:id]
      @user_name = attributes[:user_name]
      @signer_name = attributes[:signer_name]
      @email = attributes[:email]
      @type = attributes[:type]
      @access_code = attributes[:access_code]
      @add_access_code_to_email = attributes[:add_access_code_to_email]
      @require_id_lookup = attributes[:require_id_lookup]
      @id_check_configuration_name = attributes[:id_check_configuration_name]
      @live_id_recipient_authentication = attributes[:live_id_recipient_authentication]
      @facebook_recipient_authentication = attributes[:facebook_recipient_authentication]
      @linkedin_recipient_authentication = attributes[:linkedin_recipient_authentication]
      @google_recipient_authentication = attributes[:google_recipient_authentication]
      @salesforce_recipient_authentication = attributes[:salesforce_recipient_authentication]
      @twitter_recipient_authentication = attributes[:twitter_recipient_authentication]
      @yahoo_recipient_authentication = attributes[:yahoo_recipient_authentication]
      @open_id_recipient_authentication = attributes[:open_id_recipient_authentication]
      @phone_authentication = attributes[:phone_authentication]
      @signature_info = attributes[:signature_info]
      @captive_info = attributes[:captive_info]
      @custom_fields = attributes[:custom_fields]
      @routing_order = attributes[:routing_order]
      @id_check_information_input = attributes[:id_check_information_input]
      @auto_navigation = attributes[:auto_navigation]
      @recipient_attachment = attributes[:recipient_attachment]
      @note = attributes[:note]
      @role_name = attributes[:role_name]
      @template_locked = attributes[:template_locked]
      @template_required = attributes[:template_required]
      @template_access_code_required = attributes[:template_access_code_required]
      @default_recipient = attributes[:default_recipient]
    end

    def to_savon
      {"Recipient" => {
        "ID" => self.id,
        "UserName" => self.user_name,
        "SignerName" => self.signer_name,
        "Email" => self.email,
        "Type" => self.type,
        "AccessCode" => self.access_code,
        "AddAccessCodeToEmail" => self.add_access_code_to_email,
        "RequireIDLookup" => self.require_id_lookup,
        "IDCheckConfigurationName" => self.id_check_configuration_name,
        "LiveIDRecipientAuthentication" => self.live_id_recipient_authentication,
        "FacebookRecipientAuthentication" => self.facebook_recipient_authentication,
        "LinkedinRecipientAuthentication" => self.linkedin_recipient_authentication,
        "GoogleRecipientAuthentication" => self.google_recipient_authentication,
        "SalesforceRecipientAuthentication" => self.salesforce_recipient_authentication,
        "TwitterRecipientAuthentication" => self.twitter_recipient_authentication,
        "YahooRecipientAuthentication" => self.yahoo_recipient_authentication,
        "OpenIDRecipientAuthentication" => self.open_id_recipient_authentication,
        "PhoneAuthentication" => self.phone_authentication,
        "SignatureInfo" => self.signature_info,
        "CaptiveInfo" => self.captive_info,
        # TODO: CustomFields
        "RoutingOrder" => self.routing_order,
        "IDCheckInformationInput" => self.id_check_information_input,
        "AutoNavigation" => self.auto_navigation,
        # TODO: RecipientAttachment
        "Note" => self.note,
        "RoleName" => self.role_name,
        "TemplateLocked" => self.template_locked,
        "TemplateRequired" => self.template_required,
        "TemplateAccessCodeRequired" => self.template_access_code_required,
        "DefaultRecipient" => self.default_recipient
        # TODO: EmailNotification
      }.delete_if{|key, value| value.nil?}}
    end
  end

  # {http://www.docusign.net/API/3.0}ArrayOfRecipient
  class ArrayOfRecipient < ::Array
  end
end