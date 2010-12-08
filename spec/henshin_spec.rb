require "spec_helper"

describe Henshin do
  it "should set API URL" do
    Henshin.api_url = "http://foobar.com"
    Henshin.api_url.should == "http://foobar.com"
  end

  it "should raise error if API URL is not specified" do
    Henshin.api_url = nil
    lambda { Henshin.api_url }.should raise_error
  end

  it "should set API username" do
    Henshin.api_username = "12345"
    Henshin.api_username.should == "12345"
  end

  it "should raise error if API username is not specified" do
    Henshin.api_username = nil
    lambda { Henshin.api_username }.should raise_error
  end
  
  it "should set API password" do
    Henshin.api_password = "12345"
    Henshin.api_password.should == "12345"
  end

  it "should raise error if API password is not specified" do
    Henshin.api_password = nil
    lambda { Henshin.api_password }.should raise_error
  end
  
end