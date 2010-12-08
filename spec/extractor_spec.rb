require 'spec_helper'

describe Henshin::Extractor do
  before(:each) do 
    Henshin.api_url      = 'https://localhost:3000'
    Henshin.api_username = 'admin'
    Henshin.api_password = 'secret'
    @extractor = Henshin::Extractor.new   
  end                             
  
  it "should not raise error when extract text from pdf file" do         
    lambda { @extractor.extract_text(File.dirname(__FILE__) + '/fixtures/abc.pdf') }.should_not raise_error
  end
  
  it "should extract text from pdf file" do         
    result = @extractor.extract_text(File.dirname(__FILE__) + '/fixtures/abc.pdf')    
    result.should be_a(String)    
  end

  it "should raise error when extract text from doc file" do         
    lambda { @extractor.extract_text(File.dirname(__FILE__) + '/fixtures/test.doc') }.should raise_error
  end
    
end