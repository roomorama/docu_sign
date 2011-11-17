module DocuSign

  class DocuSignResponse

    def self.new(*args)
      response = args.first
      case response.to_hash.keys.first.to_sym
        when :create_and_send_envelope_response
          return EnvelopeStatus.new(response.to_hash[:create_and_send_envelope_response][:create_and_send_envelope_result])
        else
          o = allocate
          o.__send__(:initialize, *args)
      end
    end
  end

end