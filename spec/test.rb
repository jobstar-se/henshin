require '../lib/henshin'

# Henshin.api_url      = 'localhost:3000'
Henshin.api_url      = 'http://henshin.jobstar.se:3000'

output = Henshin.convert_files(['fixtures/abc.txt', 'fixtures/test.doc'])
