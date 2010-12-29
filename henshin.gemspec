# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "henshin/version"

Gem::Specification.new do |s|
  s.name        = "henshin"
  s.version     = Henshin::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vladimir Penkin"]
  s.email       = ["penkinv@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Write a gem summary}
  s.description = %q{API Client for Henshin Server}

  s.rubyforge_project = "henshin"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

#  s.add_dependency(%q<json>, [">= 0"])
#  s.add_dependency(%q<rest-client>, [">= 0"])
#  s.add_dependency(%q<ruby-debug>, [">= 0"])
#  s.add_dependency(%q<bundler>, ["~> 1.0.0"])
#  s.add_dependency(%q<rspec>, [">= 0"])
#  s.add_dependency(%q<rest-client>, [">= 0"])
end

