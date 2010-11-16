require "net/http"
require "uri" 
require 'rubygems'
require 'rest_client'
                 
module Henshin
  class APIException < StandardError; end
  class InvalidData  < APIException;  end
  extend self
  
  autoload :Client, 'henshin/client'
  
  def api_url=(url)
    @api_url = url
  end

  def api_url
    @api_url or raise "API URL is not specified"
  end
      
  def api_token=(token)
    @api_token = token
  end

  def api_token
    @api_token or raise "API token is not specified"
  end
  
  def send_api_request(api_method, params)
    # Manage a specific error code
      files = params[:files].collect {|f|
        File.new(f, 'rb')
      }
      send_params = {:files => files, :multipart => true}
      send_params.merge!({:callback_url => params[:callback_url]}) if params[:callback_url]
      send_params.merge!({:merge_files => params[:merge_files]}) if params[:merge_files]
      RestClient.post(Henshin.api_url + "/#{api_method}", send_params){ |response, request, result|
        case response.code
        when 200
          p "Everything cool!"
          response
        when Net::HTTPClientError
          raise Henshin::InvalidData, res.body if res.code == "422"
        end
      }      
  end  
  
  def convert_files(files, convert_to = 'pdf', merge_files = 'yes')
    data = { :files => files, :convert_to => 'pdf', :callback_url => 'http://localhost:3000/webhook' }
    send_api_request('jobs', data)
  end

end