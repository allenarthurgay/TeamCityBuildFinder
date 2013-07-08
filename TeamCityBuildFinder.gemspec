# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'TeamCityBuildFinder/version'

Gem::Specification.new do |spec|
  spec.name          = "TeamCityBuildFinder"
  spec.version       = TeamCityBuildFinder::VERSION
  spec.authors       = ["Allen Gay"]
  spec.email         = ["agay@daptiv.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `ls `.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


end
