module DocuSign
  class EnvelopeStatus < DocuSignModel
    ATTRIBUTES = [:recipient_statuses, :time_generated, :envelope_id, :subject, :user_name, :email, :status, :created, :deleted, :sent, :delivered, :signed, :completed, :declined, :timed_out,
      :ac_status, :ac_status_date, :ac_holder, :ac_holder_email, :ac_holder_location, :signing_location, :sender_ip_address, :envelope_pdf_hash, :custom_field, :vaulting_details, :envelope_stamping,
      :authoritative_copy, :envelope_attachment, :document_statuses, :form_data]
    ATTRIBUTES.each do |attr|
      self.send(:attr_accessor, attr)
    end

    def initialize(attributes = {})
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=", attributes[attr])
      end
    end

    def recipient_statuses=(status_attributes)
      if status_attributes && status_attributes[:recipient_status].is_a?(Hash)
        @recipient_statuses = [RecipientStatus.new(status_attributes[:recipient_status])]
      elsif status_attributes && status_attributes[:recipient_status].is_a?(Array)
        @recipient_statuses = status_attributes[:recipient_status].map{|attributes| DocuSign::RecipientStatus.new(attributes)}
      end
    end

    def document_statuses=(status_attributes)
      if status_attributes && status_attributes[:document_status].is_a?(Hash)
        @document_statuses = [DocumentStatus.new(status_attributes[:document_status])]
      elsif status_attributes && status_attributes[:document_status].is_a?(Array)
        @document_statuses = status_attributes[:document_status].map{|attributes| DocuSign::DocumentStatus.new(attributes)}
      end
    end

  end
end