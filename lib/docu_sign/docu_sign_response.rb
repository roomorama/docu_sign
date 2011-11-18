module DocuSign

  class DocuSignResponse

    def self.new(*args)
      response = args.first
      case response.to_hash.keys.first.to_sym
        when :create_and_send_envelope_response
          return EnvelopeStatus.new(response.to_hash[:create_and_send_envelope_response][:create_and_send_envelope_result])
        when :request_status_response
          return EnvelopeStatus.new(response.to_hash[:request_status_response][:request_status_result])
        when :request_status_ex_response
          return EnvelopeStatus.new(response.to_hash[:request_status_ex_response][:request_status_ex_result])
        when :request_envelope_response
          return Envelope.new(response.to_hash[:request_envelope_response][:request_envelope_result])
        when :correct_and_resend_envelope_response
          return nil
        else
          puts response.to_hash.inspect
          super
      end
    end
  end

end