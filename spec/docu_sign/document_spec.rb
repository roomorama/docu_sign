require File.dirname(__FILE__) + '/../spec_helper'

describe DocuSign::Document do
  before(:each) do
    @d = DocuSign::Document.new
  end

  it "should create a new document" do
    @d.should be_an_instance_of(DocuSign::Document)
  end

  it "should respond to tabs" do
    @d.should respond_to(:tabs)
  end

  describe "#tabs" do
    context "with no arguments" do
      it "should return an empty tab array" do
        @d.tabs.should == DocuSign::ArrayOfTab.new
      end
    end

    context "with arguments" do
      before(:each) do
        @tabs = @d.tabs stub(:id => 1) do |d|
          d.tab :name => 'tab_1', :value => 'foo'
          d.tab :name => 'tab_2', :value => 'bar'
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
      @d.tab.should be_an_instance_of(DocuSign::Tab)
    end

    it "should pass in arguments" do
      tab = @d.tab :document_id => 1
      tab.document_id.should == 1
    end
  end
end