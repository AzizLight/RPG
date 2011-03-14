# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ruby_password_generator"

Gem::Specification.new do |s|
  s.name        = "ruby_password_generator"
  s.version     = RPG::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Aziz Light"]
  s.email       = ["aziiz.light@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby Password Generator}
  s.description = %q{A password generator created in ruby with a sinatra front-end}

  s.add_dependency "sinatra", "1.2.0"

  s.add_development_dependency "minitest", "2.0.2"
  s.add_development_dependency "mynyml-redgreen", "0.7.1"
  s.add_development_dependency "watchr", "0.7"
  s.add_development_dependency "autowatchr", "0.1.5"
  s.add_development_dependency "rack-test", "0.5.7"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
