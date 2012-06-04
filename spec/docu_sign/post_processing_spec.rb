require File.dirname(__FILE__) + '/../spec_helper'

describe "Post Processing Group" do
  before do
    @client = DocuSign::Client.new(DOCU_SIGN_CONFIG)
  end

  describe "request_document_pdfs_ex" do
    use_vcr_cassette :request_document_pdfs_ex, :record => :new_episodes
    before do
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
      @envelope_id = @client.create_and_send_envelope(envelope).envelope_id
    end

    it "should successfully get an arry of document pdfs" do
      response = @client.request_document_pd_fs_ex({"EnvelopeID" => @envelope_id})
      response.should be_a_kind_of(Array)
      response.first.should be_a_kind_of(DocuSign::DocumentPDF)
    end
  end
end