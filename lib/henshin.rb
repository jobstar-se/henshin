require "net/http"
require "uri" 
require 'rubygems'
require 'rest_client'
                 
module Henshin
  class APIException   < StandardError; end
  class InvalidData    < APIException;  end
  class InvalidParams  < APIException;  end
  class InvalidAuthorization  < APIException;  end
  
  extend self
  
  # autoload :Client, 'henshin/client'
  # autoload :Extractor, 'henshin/extractor'
  
  def api_url=(url)
    @api_url = url
  end

  def api_url
    @api_url or raise "API URL is not specified"
  end
      
  def api_username=(username)
    @api_username = username
  end

  def api_username
    @api_username or raise "API username is not specified"
  end   

  def api_password=(password)
    @api_password = password
  end

  def api_password
    @api_password or raise "API password is not specified"
  end        
  
      
  def send_api_request(api_method, params = {}, method = :get)
    url = Henshin.api_url + "/#{api_method}.js"     
    # params.merge!({:accept => :json, :content_type => :json})
    params.merge!({:username => @api_username, :password => @api_password})
    
    responce_proc = Proc.new { |response, request, result|
      case response.code
        when 200
          response
        when 400
          raise Henshin::InvalidParams, response.body
        when 401
          raise Henshin::InvalidAuthorization, response.body
        when 500
          raise Henshin::InvalidData, response.body
      end
    }
    
    case method
      when :get                 
        RestClient.get(url, params, &responce_proc)
      when :post
        RestClient.post(url, params, &responce_proc)
    end
  end 
  
  
end