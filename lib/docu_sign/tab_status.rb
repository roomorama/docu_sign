module DocuSign
  class TabStatus < DocuSignModel
    ATTRIBUTES = [:tab_type, :status, :x_position, :y_position, :signed, :tab_label, :tab_name, :tab_value,
      :document_id, :page_number, :original_value, :validation_pattern, :role_name, :list_values, :list_selected_value,
      :scale_value]
    ATTRIBUTES.each do |attr|
      self.send(:attr_accessor, attr)
    end

    def initialize(attributes = {})
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=", attributes[attr])
      end
    end

  end
end