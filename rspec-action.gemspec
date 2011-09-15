# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rspec-action/version"

Gem::Specification.new do |s|
  s.name        = "rspec-action"
  s.version     = Rspec::Action::VERSION
  s.authors     = ["Alexander Glushkov"]
  s.email       = ["cutalion@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Adds an "action" method to rspec examples}
  s.description = %q{Adds an "action" method to rspec examples, which is a last "before" in fact }

  s.rubyforge_project = "rspec-action"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.6"
end
