require File.dirname(__FILE__) + '/../spec_helper'

describe DocuSign::Client do
  before do
    @client = DocuSign::Client.new(DOCU_SIGN_CONFIG)
  end

end