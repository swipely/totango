# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'totango/version'

Gem::Specification.new do |spec|
  spec.name          = "totango"
  spec.version       = Totango::VERSION
  spec.authors       = ["Matt Gillooly"]
  spec.email         = ["matt@swipely.com"]
  spec.description   = %q{Ruby client for sending events to Totango}
  spec.summary       = %q{Sends events from your application to Totango}
  spec.homepage      = "http://github.com/swipely/totango"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "excon"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
