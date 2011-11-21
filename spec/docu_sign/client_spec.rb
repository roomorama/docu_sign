require File.dirname(__FILE__) + '/../spec_helper'

describe DocuSign::Client do
  before do
    @client = DocuSign::Client.new(
        :username => "6032ec74-7bcc-4b35-bbb9-3bf8a44484f4",
        :password => "roomorama",
        :integrator_key => "ROOM-1206c237-cd8d-4f10-8ec5-d48b92a7e65b",
        :endpoint_url => "https://demo.docusign.net/api/3.0/api.asmx")
  end

end