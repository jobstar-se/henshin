require 'henshin_client'

Henshin::Client.url      = '79.99.0.10/converter'
Henshin::Client.login    = 'admin'
Henshin::Client.password = 'secret'

@converter = Henshin::Client.new
files = []
files << File.new("fixtures/abc.doc", "r")
files << File.new("fixtures/abc.txt", "r")
files << File.new("fixtures/abc.png", "r")
@converter.files = files
@converter.merge = true
converted = @converter.run
puts converted.inspect
