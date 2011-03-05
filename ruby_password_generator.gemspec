# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ruby_password_generator/version"

Gem::Specification.new do |s|
  s.name        = "ruby_password_generator"
  s.version     = RubyPasswordGenerator::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Aziz Light"]
  s.email       = ["aziiz.light@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby Password Generator}
  s.description = %q{A password generator created in ruby with a sinatra front-end}

  s.rubyforge_project = "ruby_password_generator"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
