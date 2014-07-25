# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'diver/version'

Gem::Specification.new do |spec|
  spec.name          = "diver"
  spec.version       = Diver::VERSION
  spec.authors       = ["Radu-Bogdan Croitoru"]
  spec.email         = ["croitoruradubogdan@gmail.com"]
  spec.summary       = %q{Simple, ad-hoc access to elements of deeply nested structures}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/radubogdan/ruby-diver.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
