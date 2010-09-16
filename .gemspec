# -*- encoding: utf-8 -*-
require 'rubygems' unless Object.const_defined?(:Gem)
require File.dirname(__FILE__) + "/lib/bacon/rr"
 
Gem::Specification.new do |s|
  s.name        = "bacon-rr"
  s.version     = Bacon::Rr::VERSION
  s.authors     = ["Gabriel Horner"]
  s.email       = "gabriel.horner@gmail.com"
  s.homepage    = "http://github.com/cldwalker/bacon-rr"
  s.summary = "Simple adapter to bring rr to bacon"
  s.description =  "This extends the bacon testing framework with the ability to use rr."
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = 'tagaholic'
  s.add_dependency 'bacon', '>= 1.1.0'
  s.add_dependency 'rr', '>= 1.0'
  s.files = Dir.glob(%w[{lib,test}/**/*.rb bin/* [A-Z]*.{txt,rdoc} ext/**/*.{rb,c} **/deps.rip]) + %w{Rakefile .gemspec}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE.txt"]
  s.license = 'MIT'
end
