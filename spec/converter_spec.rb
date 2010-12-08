require 'spec_helper'

describe Henshin::Converter do
  before(:each) do 
    Henshin.api_url      = 'https://localhost:3000'
    Henshin.api_username = 'admin'
    Henshin.api_password = 'secret'
    @converter = Henshin::Converter.new   
  end                             
  
  it "should convert txt files to pdf and return job_id" do
      result = @converter.convert_files(:files => File.dirname(__FILE__) + '/fixtures/abc.txt')
      result.should be_a(String)
      isNumeric(result).should be_true
    end
  
  it "should convert doc files to pdf and return job_id" do
    result = @converter.convert_files(:files => File.dirname(__FILE__) + '/fixtures/test.doc')
    result.should be_a(String)
    isNumeric(result).should be_true
  end                                                  

  it "should convert gif files to pdf and return job_id" do
    result = @converter.convert_files(:files => File.dirname(__FILE__) + '/fixtures/test.gif')
    result.should be_a(String)
    isNumeric(result).should be_true
  end  
  
  it "should retrieve job status" do
    job_id = @converter.convert_files(:files => File.dirname(__FILE__) + '/fixtures/abc.txt')
    status = @converter.job_status(job_id)
    %w( waiting ok fail ).should include(status)  
  end                                         
  
  it "should process jobs and set 'ok' status" do
    job_id = @converter.convert_files(:files => File.dirname(__FILE__) + '/fixtures/abc.txt')
    status = @converter.job_status(job_id)
    lambda {     
      while !status.eql? 'ok' do
        status = @converter.job_status(job_id)
        raise APIException if status.eql? 'fail'
        sleep 0.5        
      end
    }.should_not raise_error
  end   
        
  it "should retrieve convertion result" do
    job_id = @converter.convert_files(:files => File.dirname(__FILE__) + '/fixtures/abc.txt')
    status = @converter.job_status(job_id)
    while !status.eql? 'ok' do
      status = @converter.job_status(job_id)
      sleep 0.5        
    end
    result = @converter.job_result_url(job_id)
    puts result.inspect
    result.strip.should_not be_empty
  end
        
end