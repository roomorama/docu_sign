module DocuSign
  class RecipientStatus < DocuSignModel
    ATTRIBUTES = [:type, :email, :user_name, :routing_order, :sent, :delivered, :signed, :declined, :decline_reason,
      :status, :recipient_ip_address, :client_user_id, :custom_field, :auto_navigation, :id_check_information,
      :recipient_authentication_status, :tab_statuses, :recipient_attachment, :account_status,
      :esign_agreement_information, :form_data, :recipient_id]
    ATTRIBUTES.each do |attr|
      self.send(:attr_accessor, attr)
    end

    def initialize(attributes = {})
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=", attributes[attr])
      end
    end

    def tab_statuses=(status_attributes)
      if status_attributes.is_a?(Hash)
        @tab_statuses = [DocuSign::TabStatus.new(status_attributes[:tab_status])]
      elsif status_attributes.is_a?(Array)
        @tab_statuses = status_attributes.map{|attributes| DocuSign::TabStatus.new(attributes[:tab_status])}
      end
    end
  end
end