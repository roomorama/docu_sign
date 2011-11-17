module DocuSign
  class Envelope < DocuSignModel
    ATTRIBUTES = [:transaction_id, :asynchronous, :account_id, :documents, :recipients, :tabs, :subject, :email_blurb,
      :signing_location, :custom_fields, :vaulting_options, :auto_navigation, :envelope_id_stamping,
      :authoritative_copy, :notification, :envelope_attachment, :enforce_signer_visibility, :enable_wet_sign,
      :allow_markup, :event_notification, :allow_reassign]
    ATTRIBUTES.each do |attr|
      self.send(:attr_accessor, attr)
    end
    
    attr_writer :document_builder
    attr_writer :recipient_builder
    attr_writer :tab_builder
    attr_writer :notification_builder

    def initialize(attributes = {})
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=", attributes[attr])
      end
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

    def notification(options = {}, &block)
      @notification ||= notification_builder.build(options, &block)
    end

    def notification_builder
      @notification_builder ||= DocuSign::Builder::NotificationBuilder.new
    end

    def to_savon
      {"Envelope" => {
        "TransactionID" => self.transaction_id,
        "Asynchronous" => self.asynchronous?,
        "AccountId" => self.account_id,
        "Documents" => {
          "Document" => self.documents.collect(&:to_savon)
        },
        "Recipients" => {
          "Recipient" => self.recipients.collect(&:to_savon)
        },
        "Tabs" => {
          "Tab" => self.tabs.collect(&:to_savon)
        },
        "Subject" => self.subject,
        "EmailBlurb" => self.email_blurb,
        "SigningLocation" => self.signing_location,
        # TODO: CustomFields
        # TODO: VaultingOptions
        "AutoNavigation" => self.auto_navigation?,
        "EnvelopeIDStamping" => self.envelope_id_stamping?,
        "AuthoritativeCopy" => self.authoritative_copy?,
        # TODO: EnvelopeAttachment
        "Notification" => self.notification.try(:to_savon),
        "EnforceSignerVisibility" => self.enforce_signer_visibility?,
        "EnableWetSign" => self.enable_wet_sign?,
        "AllowMarkup" => self.allow_markup?,
        # TODO: EventNotification
        "AllowReassign" => self.allow_reassign?
      }.delete_if{|key, value| value.nil?}}
    end

  end

end