require '../lib/henshin'
require '../lib/henshin/client'
require 'ruby-debug'

# Henshin.api_url      = 'http://henshin.jobstar.se:3000'
Henshin.api_url      = 'http://localhost:3000'
Henshin.api_username = 'admin'
Henshin.api_password = 'secret'

files = ['fixtures/abc.txt', 'fixtures/test.doc']

client = Henshin::Client.new
job_id = client.convert_files(:files => files)

p "JobId: #{job_id}"
p "Job: Converting files #{files.inspect}"
p "==========="                         
puts client.job_status(job_id)  

while true do
  status = client.job_status(job_id)  
  break if status == 'ok'
  sleep 0.5
end

result_url = client.job_result_url(job_id)  

puts "Result url: #{result_url}"
