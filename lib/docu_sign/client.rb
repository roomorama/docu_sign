module DocuSign
  class Client
    attr_accessor :client
    class << self
      def login(options={})

        client  = Savon::Client.new do
          wsdl.document = File.expand_path("../../../wsdl/dsapi.wsdl", __FILE__)
          wsdl.endpoint = options[:endpoint_url] if options[:endpoint_url]
        end

        if options[:integrator_key]
          client.wsse.credentials "[#{options[:integrator_key]}]#{options[:username]}", options[:password]
          client.http.headers["X-DocuSign-Authentication"] = "<DocuSignCredentials><Username>#{options[:username]}</Username><Password>#{options[:password]}</Password><IntegratorKey>#{options[:integrator_key]}</IntegratorKey></DocuSignCredentials>"
        end

        # if options[:integrators_key]
        #           header = IntegratorsKeyAuthHeaderHandler.new(
        #             :email           => options.delete(:email),
        #             :integrators_key => options.delete(:integrators_key),
        #             :password        => options.delete(:password)
        #           )
        #         else
        #           header = AuthHeaderHandler.new(
        #             :user_name => options.delete(:user_name),
        #             :password  => options.delete(:password)
        #           )
        #         end
        #
        #         connection.headerhandler << header
        #
        #         options.each do |key, value|
        #           connection.send("#{key}=", value)
        #         end

        client
      end

      def credentials(email, password, endpoint_url=nil)

        connection = DocuSign::Credential::CredentialSoap.new
        connection.endpoint_url = endpoint_url if endpoint_url

        connection.login(:email => email, :password => password).login_result
      end
    end

    def initialize(options={})
      self.client = self.class.login(options)
    end

    def method_missing(api_method, *args, &block) # :nodoc:
      if self.client.wsdl.soap_actions.include?(api_method)
        response = self.client.request(api_method) do
          soap.body = (args.first.respond_to?(:to_savon) ? args.first.to_savon : args.first) if args.first
        end
        return DocuSignResponse.new(response)
      else
        super
      end
    end
  end
end