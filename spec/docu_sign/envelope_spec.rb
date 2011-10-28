require File.dirname(__FILE__) + '/../spec_helper'

describe DocuSign::Envelope do
  before(:each) do
    @e = DocuSign::Envelope.new
  end

  it "should create a new envelope" do
    @e.should be_an_instance_of(DocuSign::Envelope)
  end
end