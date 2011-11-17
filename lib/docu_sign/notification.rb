module DocuSign
  class Notification < DocuSignModel
    ATTRIBUTES = [:use_account_defaults, :reminders, :expirations]
    ATTRIBUTES.each do |attr|
      self.send(:attr_accessor, attr)
    end

    def initialize(attributes = {})
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=", attributes[attr])
      end
    end

    def to_savon
      { "UseAccountDefaults" => self.use_account_defaults?,
        "Reminders" => (self.reminders.is_a?(Hash) ? {"ReminderEnabled" => self.reminders[:reminder_enabled], "ReminderDelay" => self.reminders[:reminder_delay], "ReminderFrequency" => self.reminders[:reminder_frequency]} : nil),
        "Expirations" => (self.expirations.is_a?(Hash) ? {"ExpireEnabled" => self.expirations[:expire_enabled], "ExpireAfter" => self.expirations[:expire_after], "ExpireWarn" => self.expirations[:expire_warn]} : nil)
      }.delete_if{|key, value| value.nil?}
    end
  end
end