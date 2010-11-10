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
      RestClient.post(Henshin.api_url + "/#{api_method}", :files => files, :multipart => true){ |response, request, result|
        case response.code
        when 200
          p "It worked !"
          response
        when Net::HTTPClientError
          raise Henshin::InvalidData, res.body if res.code == "422"
        # else
        #   response.return!(request, result, &block)
        end
      }

    # if request_method == :post
    #   url = URI.parse(Henshin.api_url + "/#{api_method}")
    #   req = Net::HTTP::Post.new(url.path)
    #   req.set_form_data(params)
    # 
    # # TODO: replace with tokens
    # # req.basic_auth 'admin', 'admin'
    # 
    # res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
    # case res
    #   when Net::HTTPSuccess, Net::HTTPRedirection
    #     return ::ActiveSupport::JSON.decode(res.body)
    #   when Net::HTTPClientError
    #     
    # end
    # 
    # raise Henshin::APIException, res.error!
  end  
  
  def convert_files(files, convert_to = 'pdf', merge_files = 'yes')
    data = {:files => files, :convert_to => 'pdf'}
    send_api_request('jobs', data)
  end

end