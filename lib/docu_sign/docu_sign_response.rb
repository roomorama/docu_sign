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
        when :request_statuses_response
          #puts response.to_hash.inspect
          return response.to_hash[:request_statuses_response][:request_statuses_result][:envelope_statuses][:envelope_status].map {|envelope_status_attributes| 
            EnvelopeStatus.new(envelope_status_attributes)}
        when :request_envelope_response
          return Envelope.new(response.to_hash[:request_envelope_response][:request_envelope_result])
        when :void_envelope_response
          return VoidEnvelopeStatus.new(response.to_hash[:void_envelope_response][:void_envelope_result])
        when :correct_and_resend_envelope_response
          return nil
        when :request_document_pd_fs_ex_response
          return response.to_hash[:request_document_pd_fs_ex_response][:request_document_pd_fs_ex_result][:document_pdf].map {|document_pdf_attributes| DocumentPDF.new(document_pdf_attributes)}
        else
          puts response.to_hash.inspect
          return response
      end
    end
  end

end