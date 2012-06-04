require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DocuSign" do
  describe "login" do
    it "return a new savon client" do
      client = DocuSign::Client.new(DOCU_SIGN_CONFIG)
      client.client.should be_an_instance_of(Savon::Client)
    end
  end

  context "with a client objects" do
    use_vcr_cassette :ping

    before do
      @docusign = DocuSign::Client.new(DOCU_SIGN_CONFIG)
    end

    it "should successfully ping the service" do
      response = @docusign.client.request :ping
      response.should be_an_instance_of(Savon::SOAP::Response)
    end

    it "should support method calls through method_missing" do
      response = @docusign.ping
      response.should be_an_instance_of(Savon::SOAP::Response)
    end
  end
end
