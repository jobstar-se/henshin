require "bundler"
Bundler.setup

require "henshin"

def isNumeric(s)
  begin
    Float(s)
  rescue
    false # not numeric
  else
    true # numeric
  end
end