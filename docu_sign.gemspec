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
  s.license = "MIT"

  s.rubyforge_project = "docu_sign"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "savon", ">= 0.9.9"
  s.add_runtime_dependency "builder"

  s.add_development_dependency "rspec", ">= 2.6.3"
  s.add_development_dependency "rails", ">= 3.0.10"
  s.add_development_dependency "capybara"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "debugger"
  s.add_development_dependency "webmock", ">= 1.7.0"
  s.add_development_dependency "savon_spec", ">= 0.1.6"
  s.add_development_dependency "vcr"
end
