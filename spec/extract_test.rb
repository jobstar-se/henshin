require '../lib/henshin'
require '../lib/henshin/extractor'

# Henshin.api_url      = 'http://henshin.jobstar.se:3000'
Henshin.api_url      = 'localhost:3000'
Henshin.api_username = 'admin'
Henshin.api_password = 'secret'

client = Henshin::Extractor.new
text = client.extract_text('fixtures/abc.pdf')

p "Input file: 'fixtures/abc.pdf'"
p "Extracted text: #{text}"