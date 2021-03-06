# Henshin Converter

API client for Jobstar File Conversion Service.

## Install

Add the following line to your Gemfile and run `bundle install`:

    gem 'henshin_client', :git => 'git@github.com:pederbl/henshin_client.git'

Create an initializer file in `config/initializers` in which you'll set up the API url and token:

    Henshin.api_url      = 'https://henshin.jobstar.se'
    Henshin.api_username = 'admin'
    Henshin.api_password = 'secret'
    
Save the file and restart your application.

## Converting Files
### Create convertion job
Set parameters to instance

    @henshin = Henshin::Converter.new
    @henshin.files = ['file1.doc', 'file2.txt', 'file3.jpg']
    @henshin.merge_files = true
    job_id = @henshin.convert_files

Or pass parameters to method

    @henshin = Henshin::Converter.new
    job_id = @henshin.convert_files(:files => ['file1.doc'])
    
  or with additional parameters
  
    job_id = @henshin.convert_files(:files => ['file1.doc'], :merge_files => true, :callback_url => 'http://henshin.jobstar.se/webhook')
    
  by default text-based data will be converted to image-based pdf, to turn data in to ordinary pdf use:
    
    job_id = @henshin.convert_files(:files => ['file1.doc'], :convert_to => 'pdf)
    
    
### Check job status

    status = @henshin.job_status(job_id)
    
### Get job result url

    result_url = @henshin.job_result_url(job_id)  
    
### Get job result database_id

    result_id = @henshin.job_result_id(job_id)  


### Example

    require 'henshin'
    Henshin.api_url      = 'https://hensin.jobstar.se'
    Henshin.api_username = 'admin'
    Henshin.api_password = 'secret'

    client = Henshin::Converter.new
    job_id = client.convert_files(:files => files)

    while true do
      status = client.job_status(job_id)  
      break if status == 'ok'
      sleep 0.5
    end

    result_url = client.job_result_url(job_id)  

## Extract text from pdf

    @extractor = Henshin::Extractor.new
    text = @extractor.extract_text('path/filename.pdf')    
                      
## Testing
  To run tests you need to fire up henshin_server on port 3000, and Job Daemon need to be running  
  Simply run 'rake rspec'
  
## TODO
                                                       
  