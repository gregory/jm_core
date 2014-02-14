# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jm_core/version'

Gem::Specification.new do |spec|
  spec.name          = "jm_core"
  spec.version       = JmCore::VERSION
  spec.authors       = ["gregory"]
  spec.email         = ["greg2502@gmail.com"]
  spec.description   = %q{JM code logic}
  spec.summary       = %q{This will wrap all the domain logic for JM}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-debugger"
  spec.add_development_dependency "pry-rescue"
  spec.add_development_dependency "pry-stack_explorer"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "spork"

  spec.add_dependency 'virtus', "~> 1.0.1"
  spec.add_dependency 'wisper', "~> 1.2.1"
end
