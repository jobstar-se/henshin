# Henshin Client

API client for Jobstar File Conversion Service.

## Install

Add the following line to your Gemfile and run `bundle install`:

    gem 'henshin_client', :git => 'git@github.com:pederbl/henshin_client.git'

Create an initializer file in `config/initializers` in which you'll set up the API url and token:

    Henshin::Client.url      = '79.99.0.10/converter'
    Henshin::Client.login    = 'admin'
    Henshin::Client.password = 'secret'
    

Save the file and restart your application.

## Converting Files

    @converter = Henshin::Client.new
    @converter.files = ['file1.doc', 'file2.txt', 'file3.jpg']
    @converter.merge = true
    converted = @converter.run
    

## Handling exceptions
    
    In future