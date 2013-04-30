module DocuSign
  class Recipient < DocuSignModel
    ATTRIBUTES = [:id, :user_name, :signer_name, :email, :type, :access_code, :add_access_code_to_email,
      :require_id_lookup, :id_check_configuration_name, :live_id_recipient_authentication,
      :facebook_recipient_authentication, :linkedin_recipient_authentication, :google_recipient_authentication,
      :salesforce_recipient_authentication, :twitter_recipient_authentication, :yahoo_recipient_authentication,
      :open_id_recipient_authentication, :phone_authentication, :signature_info, :captive_info, :custom_fields,
      :routing_order, :id_check_information_input, :auto_navigation, :recipient_attachment, :note, :role_name,
      :template_locked, :template_required, :template_access_code_required, :default_recipient]
    ATTRIBUTES.each do |attr|
      self.send(:attr_accessor, attr)
    end

    def initialize(attributes = {})
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=", attributes[attr])
      end
    end

    def to_savon
      {
        "ID" => self.id,
        "UserName" => self.user_name,
        "SignerName" => self.signer_name,
        "Email" => self.email,
        "Type" => self.type,
        "AccessCode" => self.access_code,
        "AddAccessCodeToEmail" => self.add_access_code_to_email,
        "RequireIDLookup" => self.require_id_lookup?,
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
      }.delete_if{|key, value| value.nil?}
    end
  end

  # {http://www.docusign.net/API/3.0}ArrayOfRecipient
  class ArrayOfRecipient < ::Array
  end
end