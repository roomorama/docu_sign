# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "docu_sign/version"

Gem::Specification.new do |s|
  s.name        = "docu_sign"
  s.version     = DocuSign::VERSION
  s.authors     = ["Donald Piret"]
  s.email       = ["donald@donaldpiret.com"]
  s.homepage    = ""
  s.summary     = %q{DocuSign API gem}
  s.description = %q{Savon-based gem to interact with the DocuSign SOAP API in Ruby}

  s.rubyforge_project = "docu_sign"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "savon"

  s.add_development_dependency "rspec", ">= 2.6.3"
  s.add_development_dependency "rcov"
  s.add_development_dependency "rails", ">= 3.0.10"
  s.add_development_dependency "capybara"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "ruby-debug19"
end
