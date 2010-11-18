# Henshin Client

API client for Jobstar File Conversion Service.

## Install

Add the following line to your Gemfile and run `bundle install`:

    gem 'henshin_client', :git => 'git@github.com:pederbl/henshin_client.git'

Create an initializer file in `config/initializers` in which you'll set up the API url and token:

    Henshin.api_url      = '79.99.0.10'
    Henshin.api_username = 'admin'
    Henshin.api_password = 'secret'
    
Save the file and restart your application.

## Converting Files
### Create convertion job
Set parameters to instance

    @henshin = Henshin::Client.new
    @henshin.files = ['file1.doc', 'file2.txt', 'file3.jpg']
    @henshin.merge_files = true
    @henshin.do_callback = false
    job_id = @henshin.convert_files

Or pass parameters to method

    @henshin = Henshin::Client.new
    job_id = @henshin.convert_files(:files => ['file1.doc'], :merge_files => true, :do_callback => true, :callback_url => 'http://henshin.jobstar.se/webhook')
    
### Check job status

    status = @henshin.job_status(job_id)
    
### Get job result url

    result_url = @henshin.job_result_url(job_id)  
    
### Get job result database_id

    result_id = @henshin.job_result_id(job_id)  


### Example

    require 'henshin'
    Henshin.api_url      = 'localhost:3000'
    Henshin.api_username = 'admin'
    Henshin.api_password = 'secret'

    client = Henshin::Client.new
    job_id = client.convert_files(:files => files)

    while true do
      status = client.job_status(job_id)  
      break if status == 'ok'
      sleep 0.5
    end

    result_url = client.job_result_url(job_id)  
    
                      
## TODO
  _SSL support_

## Handling exceptions
    
    In future