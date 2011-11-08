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
  class Envelope
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
    attr_writer :document_builder
    attr_writer :recipient_builder
    attr_writer :tab_builder

    def initialize(transaction_id = nil, asynchronous = nil, account_id = nil, documents = nil, recipients = nil, tabs = nil, subject = nil, email_blurb = nil, signing_location = nil, custom_fields = nil, vaulting_options = nil, auto_navigation = nil, envelope_id_stamping = nil, authoritative_copy = nil, notification = nil, envelope_attachment = nil, enforce_signer_visibility = nil, enable_wet_sign = nil, allow_markup = nil, event_notification = nil)
      @transaction_id = transaction_id
      @asynchronous = asynchronous
      @account_id = account_id
      @documents = documents
      @recipients = recipients
      @tabs = tabs
      @subject = subject
      @email_blurb = email_blurb
      @signing_location = signing_location
      @custom_fields = custom_fields
      @vaulting_options = vaulting_options
      @auto_navigation = auto_navigation
      @envelope_id_stamping = envelope_id_stamping
      @authoritative_copy = authoritative_copy
      @notification = notification
      @envelope_attachment = envelope_attachment
      @enforce_signer_visibility = enforce_signer_visibility
      @enable_wet_sign = enable_wet_sign
      @allow_markup = allow_markup
      @event_notification = event_notification
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

  end

end