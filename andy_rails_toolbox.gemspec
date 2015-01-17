$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "andy_rails_toolbox/version"

Gem::Specification.new do |s|
  s.name        = "andy_rails_toolbox"
  s.version     = AndyRailsToolbox::VERSION
  s.authors     = ["ChouAndy"]
  s.email       = ["chouandy625@gmail.com"]
  s.homepage    = "https://github.com/ChouAndy/andy_rails_toolbox"
  s.summary     = "Includes many useful helpers for rails development."
  s.description = "Andy Rails Toolbox includes many useful helpers for rails development."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "redcarpet"
  s.add_dependency "pygments.rb"
end
