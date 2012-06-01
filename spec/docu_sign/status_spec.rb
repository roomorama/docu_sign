require File.dirname(__FILE__) + '/../spec_helper'

describe "Status and Managing functions" do
  before do
    @client = DocuSign::Client.new(
        :username => "6032ec74-7bcc-4b35-bbb9-3bf8a44484f4",
        :password => "roomorama",
        :integrator_key => "ROOM-1206c237-cd8d-4f10-8ec5-d48b92a7e65b",
        :endpoint_url => "https://demo.docusign.net/api/3.0/api.asmx")
  end

  describe "request_envelope" do
    use_vcr_cassette :request_envelope
    before do
      @envelope = create_docusign_envelope
    end

    it "should correctly retrieve an envelope given an envelope id" do
      envelope = @client.request_envelope({"EnvelopeID" => @envelope.envelope_id, "IncludeDocumentBytes" => "false"})
      envelope.should be_an_instance_of(DocuSign::Envelope)
    end
  end
  
  describe "request_status" do
    use_vcr_cassette :request_status
    before do
      @envelope = create_docusign_envelope
    end
    
    it "should correctly retrieve an envelope status given an envelope id" do
      @envelope_status = @client.request_status(:envelope_id => @envelope.envelope_id)
      @envelope_status.recipient_statuses.first.status.should eq("Sent")
    end
  end
  
  describe "request_status_ex" do
    use_vcr_cassette :request_status_ex
    before do
      @envelope = create_docusign_envelope
    end
    
    it "should correctly retrieve the extended status given an envelope id" do
      @envelope_status = @client.request_status_ex(:envelope_id => @envelope.envelope_id)
      @envelope_status.recipient_statuses.first.status.should eq("Sent")
    end
  end
  
  describe "request_statuses" do
    use_vcr_cassette :request_statuses, :record => :new_episodes
    before do
      @envelope = create_docusign_envelope
      @envelope2 = create_docusign_envelope
    end
    
    it "should correctly retrieve both envelope statuses" do
      @envelope_statuses = @client.request_statuses(:envelope_status_filter => {"AccountId" => "678cce00-95a7-4279-9101-557b3868d7aa", "EnvelopeIds" => {"EnvelopeId" => [@envelope.envelope_id, @envelope2.envelope_id]}})
      puts @envelope_statuses.inspect
    end
  end
      

  describe "void_envelope" do
    use_vcr_cassette :void_envelope
    before do
      @envelope_id = create_docusign_envelope
    end

    it "should correctly void an envelope given an envelope id" do
      @void = @client.void_envelope({"EnvelopeID" => @envelope_id, "Reason" => "Booking Cancelled"})
      @void.should be_an_instance_of(DocuSign::VoidEnvelopeStatus)
      @void.void_success.should be_true
    end

    it "should work with snake case input parameters" do
      @void = @client.void_envelope(:envelope_id => @envelope_id, :reason => "Booking Cancelled")
      @void.should be_an_instance_of(DocuSign::VoidEnvelopeStatus)
      @void.void_success.should be_true
    end
  end

  def create_docusign_envelope
    envelope = DocuSign::Envelope.new.tap do |e|
      e.transaction_id = "Test#{Time.now.to_i.to_s}"
      e.account_id = "678cce00-95a7-4279-9101-557b3868d7aa"
      e.asynchronous = false
      e.subject = "Test Envelope"
      e.notification do |n|
        n.use_account_defaults = false
        n.reminders = {
          :reminder_enabled => true,
          :reminder_delay => 2,
          :reminder_frequency => 2
        }
        n.expirations = {
          :expire_enabled => true,
          :expire_after => 10,
          :expire_warn => 2
        }
      end
    end
    # Documents
    envelope.documents do |e|
      file = File.open(File.dirname(__FILE__) + '/../fixtures/document.pdf', "rb")
      contents = file.read
      e.document :id => 1,
        :name => "Document",
        :pdf_bytes => Base64.encode64(contents),
        :file_extension => 'pdf'
    end
    # Recipients
    envelope.recipients do |e|
      e.recipient :id => 1,
        :user_name => "Recipient 1",
        :email => "donald@donaldpiret.com",
        :type => "Signer",
        :require_id_lookup => false
    end
    # Tabs
    envelope.tabs do |e|
      e.tab :document_id => 1,
        :recipient_id => 1,
        :page_number => 1,
        :x_position => 100,
        :y_position => 200,
        :type => "SignHere",
        :anchor => {
          :string => "blank",
          :x => "200",
          :y => 0,
          :unit => "Pixels",
          :ignore_if_not_present => false
        }
      e.tab :document_id => 1,
        :recipient_id => 1,
        :page_number => 1,
        :x_position => 100,
        :y_position => 200,
        :type => "SignerAttachment",
        :anchor => {
          :string => "blank",
          :x => "200",
          :y => 0,
          :unit => "Pixels",
          :ignore_if_not_present => false
        }
    end
    return @client.create_and_send_envelope(envelope)
  end

end