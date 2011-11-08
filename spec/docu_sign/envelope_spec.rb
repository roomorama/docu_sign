require File.dirname(__FILE__) + '/../spec_helper'

describe DocuSign::Envelope do
  before(:each) do
    @e = DocuSign::Envelope.new
  end

  it "should create a new envelope" do
    @e.should be_an_instance_of(DocuSign::Envelope)
  end

  it "should respond to documents" do
    @e.should respond_to(:documents)
  end

  describe "#documents" do
    context "with no arguments" do
      it "should return an empty document array" do
        @e.documents.should == []
      end
    end

    context "with arguments" do
      before(:each) do
        @documents = @e.documents do |e|
          e.document :name => 'Document 1'
          e.document :name => 'Document 2'
        end
      end

      it "should build documents" do
        @documents.all? { |t| t.is_a?(DocuSign::Document) }.should be_true
      end

      it "should build the appropriate number of tabs" do
        @documents.size.should == 2
      end
    end
  end

  describe "#document" do
    it "should build a document" do
      @e.document.should be_an_instance_of(DocuSign::Document)
    end

    it "should pass in arguments" do
      document = @e.document :name => "Document 1"
      document.name.should == "Document 1"
    end
  end

  it "should respond to recipients" do
    @e.should respond_to(:recipients)
  end

  describe "#recipients" do
    context "with no arguments" do
      it "should return an empty recipient array" do
        @e.recipients.should == []
      end
    end

    context "with arguments" do
      before(:each) do
        @recipients = @e.recipients do |e|
          e.recipient :id => 1
          e.recipient :id => 2
        end
      end

      it "should build recipients" do
        @recipients.all? { |r| r.is_a?(DocuSign::Recipient) }.should be_true
      end

      it "should build the appropriate number of recipients" do
        @recipients.size.should == 2
      end
    end
  end

  describe "#recipient" do
    it "should build a recipient" do
      @e.recipient.should be_an_instance_of(DocuSign::Recipient)
    end

    it "should pass in arguments" do
      recipient = @e.recipient :id => 1
      recipient.id.should == 1
    end
  end

  it "should respond to tabs" do
    @e.should respond_to(:tabs)
  end

  describe "#tabs" do
    context "with no arguments" do
      it "should return an empty tab array" do
        @e.tabs.should == []
      end
    end

    context "with arguments" do
      before(:each) do
        @tabs = @e.tabs stub(:id => 1) do |e|
          e.tab :name => 'tab_1', :value => 'foo'
          e.tab :name => 'tab_2', :value => 'bar'
        end
      end

      it "should build tabs" do
        @tabs.all? { |t| t.is_a?(DocuSign::Tab) }.should be_true
      end

      it "should build the appropriate number of tabs" do
        @tabs.size.should == 2
      end
    end
  end

  describe "#tab" do
    it "should build a tab" do
      @e.tab.should be_an_instance_of(DocuSign::Tab)
    end

    it "should pass in arguments" do
      tab = @e.tab :document_id => 1
      tab.document_id.should == 1
    end
  end

end