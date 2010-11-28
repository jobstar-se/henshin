module Henshin  
  class Extractor

    def files
      @files ||= []
    end                     
    
    def extract_text(file)
      params = {:multipart => true}
      params.merge!({ :files => [File.new(file, 'rb')]})      
      text = Henshin.send_api_request('extractor', params, :post)
      text
    end                             
    
  end
end