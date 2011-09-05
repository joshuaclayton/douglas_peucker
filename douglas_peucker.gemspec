# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "douglas_peucker/version"

Gem::Specification.new do |s|
  s.name        = "douglas_peucker"
  s.version     = DouglasPeucker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Josh Clayton"]
  s.email       = ["joshua.clayton@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A Ruby implementation of the Douglas–Peucker algorithm}
  s.summary     = %q{A Ruby implementation of the Douglas–Peucker algorithm}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency("rspec", "~> 2.6.0")
end
