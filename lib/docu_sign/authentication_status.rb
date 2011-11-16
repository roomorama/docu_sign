module DocuSign
  class AuthenticationStatus < DocuSignModel
    ATTRIBUTES = [:access_code_result, :id_question_result, :id_lookup_result, :age_verify_result, :stan_pin_result,
      :ofac_result, :phone_auth_result]
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