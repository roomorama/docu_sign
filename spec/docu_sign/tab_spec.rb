require File.dirname(__FILE__) + '/../spec_helper'

describe DocuSign::Tab do
  before(:each) do
    @t = DocuSign::Tab.new
  end

  it "should create a new tab" do
    @t.should be_an_instance_of(DocuSign::Tab)
  end

  it "should accept anchor blocks to create an anchor tab" do
    @t.anchor do |a|
      a.anchor_tab_string = "Test"
      a.x_offset = "200"
      a.y_offset = "0"
    end
    @t.anchor_tab_item.should be_an_instance_of(DocuSign::AnchorTab)
  end

  it "should accept anchor attributes to create an anchor tab" do
    @t.anchor = {
      :string => "Signature:",
      :x_offset => "200",
      :y_offset => 0,
      :unit => "Pixels",
      :ignore_if_not_present => false
    }
    @t.anchor_tab_item.should be_an_instance_of(DocuSign::AnchorTab)
    @t.anchor_tab_item.string.should == "Signature:"
  end
end