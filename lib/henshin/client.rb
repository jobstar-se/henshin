module Henshin  
  class Client
    attr_accessor :convert_to, :merge_files, :do_callback, :callback_url

    def files
      @files ||= []
    end                     
    
    # Parameters:
    # :files, :merge_files, :do_callback, :callback_url 
    def convert_files(opts = {})   
      params = convert_params(opts.merge({:multipart => true}))
      job_id = Henshin.send_api_request('jobs', params, :post)
      job_id
    end                             
    
    def job_status(job_id)
      status = Henshin.send_api_request("jobs/#{job_id}/status")    
      status
    end    
    
    def job_result_url(job_id)
      result = Henshin.send_api_request("jobs/#{job_id}/result_url")
      result
    end
    
    def job_result_id(job_id)
      result = Henshin.send_api_request("jobs/#{job_id}/result_id")
      result
    end 
    
    private 
    
      def convert_params(opts = {})   
        params = default_convert_params 
               
        if !opts[:files].empty? 
          opts[:files] = opts[:files].collect {|f|
            File.new(f, 'rb')
          }
        elsif !@files.empty?
          opts[:files] = @files.collect {|f|
            File.new(f, 'rb')
          }          
        end
        
        opts[:convert_to] ||= @convert_to || params[:convert_to]
        opts[:merge_files] ||= @merge_files || params[:merge_files]
        opts[:do_callback] ||= @do_callback || params[:do_callback]
        opts[:callback_url] ||= @callback_url || params[:callback_url]
        
        params.merge!(opts)
      end  
      
      def default_convert_params
        { 
          :convert_to => 'pdf', 
          :merge_files => true, 
          :do_callback => false, 
          :callback_url => 'http://localhost:3000/webhook' 
        }
      end

  end
end     