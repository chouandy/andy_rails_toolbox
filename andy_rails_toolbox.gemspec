# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'andy_rails_toolbox/version'

Gem::Specification.new do |spec|
  spec.name          = "andy_rails_toolbox"
  spec.version       = AndyRailsToolbox::VERSION
  spec.authors       = ["ChouAndy"]
  spec.email         = ["chouandy625@gmail.com"]
  spec.summary       = %q{Includes many useful helpers for rails development.}
  spec.description   = %q{Andy Rails Toolbox includes many useful helpers for rails development.}
  spec.homepage      = "https://github.com/ChouAndy/andy_rails_toolbox"
  spec.license       = "MIT"

  spec.files         = Dir["{app,lib}/**/*"] + ["CHANGELOG.md", "LICENSE.txt", "Rakefile", "README.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
