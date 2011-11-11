module DocuSign
  # {http://www.docusign.net/API/3.0}Envelope
  #   transactionID - SOAP::SOAPString
  #   asynchronous - SOAP::SOAPBoolean
  #   accountId - SOAP::SOAPString
  #   documents - Docusign::ArrayOfDocument
  #   recipients - Docusign::ArrayOfRecipient
  #   tabs - Docusign::ArrayOfTab
  #   subject - SOAP::SOAPString
  #   emailBlurb - SOAP::SOAPString
  #   signingLocation - Docusign::SigningLocationCode
  #   customFields - Docusign::ArrayOfCustomField
  #   vaultingOptions - Docusign::VaultingOptions
  #   autoNavigation - SOAP::SOAPBoolean
  #   envelopeIdStamping - SOAP::SOAPBoolean
  #   authoritativeCopy - SOAP::SOAPBoolean
  #   notification - Docusign::Notification
  #   envelopeAttachment - Docusign::ArrayOfAttachment
  #   enforceSignerVisibility - SOAP::SOAPBoolean
  #   enableWetSign - SOAP::SOAPBoolean
  #   allowMarkup - SOAP::SOAPBoolean
  #   eventNotification - Docusign::EventNotification
  class Envelope < DocuSignModel
    attr_accessor :transaction_id
    attr_accessor :asynchronous
    attr_accessor :account_id
    attr_accessor :documents
    attr_accessor :recipients
    attr_accessor :tabs
    attr_accessor :subject
    attr_accessor :email_blurb
    attr_accessor :signing_location
    attr_accessor :custom_fields
    attr_accessor :vaulting_options
    attr_accessor :auto_navigation
    attr_accessor :envelope_id_stamping
    attr_accessor :authoritative_copy
    attr_accessor :notification
    attr_accessor :envelope_attachment
    attr_accessor :enforce_signer_visibility
    attr_accessor :enable_wet_sign
    attr_accessor :allow_markup
    attr_accessor :event_notification
    attr_accessor :allow_reassign
    attr_writer :document_builder
    attr_writer :recipient_builder
    attr_writer :tab_builder

    def initialize(attributes = {})
      @transaction_id = attributes[:transaction_id]
      @asynchronous = attributes[:asynchronous]
      @account_id = attributes[:account_id]
      @documents = attributes[:documents]
      @recipients = attributes[:recipients]
      @tabs = attributes[:tabs]
      @subject = attributes[:subject]
      @email_blurb = attributes[:email_blurb]
      @signing_location = attributes[:signing_location]
      @custom_fields = attributes[:custom_fields]
      @vaulting_options = attributes[:vaulting_options]
      @auto_navigation = attributes[:auto_navigation]
      @envelope_id_stamping = attributes[:envelope_id_stamping]
      @authoritative_copy = attributes[:authoritative_copy]
      @notification = attributes[:notification]
      @envelope_attachment = attributes[:envelope_attachment]
      @enforce_signer_visibility = attributes[:enforce_signer_visibility]
      @enable_wet_sign = attributes[:enable_wet_sign]
      @allow_markup = attributes[:allow_markup]
      @event_notification = attributes[:event_notification]
      @allow_reassign = attributes[:allow_reassign]
    end

    ##
    # Documents
    def documents(&block)
      @documents ||= DocuSign::ArrayOfDocument.new

      return @documents unless block_given?

      self.document_builder = DocuSign::Builder::DocumentBuilder.new()

      @documents.tap do |a|
        yield self if block_given?
      end
    end

    def document(options = {}, &block)
      document_builder.build(options, &block).tap do |d|
        documents << d
      end
    end

    def document_builder
      @document_builder ||= DocuSign::Builder::DocumentBuilder.new()
    end

    ##
    # Recipients
    def recipients(&block)
      @recipients ||= DocuSign::ArrayOfRecipient.new

      return @recipients unless block_given?

      self.recipient_builder = DocuSign::Builder::RecipientBuilder.new()

      @recipients.tap do |r|
        yield self if block_given?
      end
    end

    def recipient(options = {}, &block)
      recipient_builder.build(options, &block).tap do |r|
        recipients << r
      end
    end

    def recipient_builder
      @recipient_builder ||= DocuSign::Builder::RecipientBuilder.new()
    end

    ##
    # Tabs
    def tabs(recipient = nil, &block)
      @tabs ||= DocuSign::ArrayOfTab.new

      return @tabs unless block_given?

      self.tab_builder = DocuSign::Builder::TabBuilder.new(nil, recipient)

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
      @tab_builder ||= DocuSign::Builder::TabBuilder.new(nil)
    end

    def to_savon
      {"Envelope" => {
        "TransactionID" => self.transaction_id,
        "Asynchronous" => self.asynchronous?,
        "AccountId" => self.account_id,
        "Documents" => self.documents.collect(&:to_savon),
        "Recipients" => self.recipients.collect(&:to_savon),
        "Tabs" => self.tabs.collect(&:to_savon),
        "Subject" => self.subject,
        "EmailBlurb" => self.email_blurb,
        "SigningLocation" => self.signing_location,
        # TODO: CustomFields
        # TODO: VaultingOptions
        "AutoNavigation" => self.auto_navigation?,
        "EnvelopeIDStamping" => self.envelope_id_stamping?,
        "AuthoritativeCopy" => self.authoritative_copy?,
        # TODO: EnvelopeAttachment
        # TODO: Notification
        "EnforceSignerVisibility" => self.enforce_signer_visibility?,
        "EnableWetSign" => self.enable_wet_sign?,
        "AllowMarkup" => self.allow_markup?,
        # TODO: EventNotification
        "AllowReassign" => self.allow_reassign?
      }.delete_if{|key, value| value.nil?}}
    end

  end

end