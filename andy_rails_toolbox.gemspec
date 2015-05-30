$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'andy_rails_toolbox/version'

Gem::Specification.new do |spec|
  spec.name        = 'andy_rails_toolbox'
  spec.version     = AndyRailsToolbox::VERSION
  spec.authors     = ['ChouAndy']
  spec.email       = ['chouandy625@gmail.com']
  spec.homepage    = 'https://github.com/ChouAndy/andy_rails_toolbox'
  spec.summary     = 'Includes many useful helpers for rails development.'
  spec.description = 'Andy Rails Toolbox includes many useful helpers for rails development.'
  spec.license     = 'MIT'

  spec.files       = Dir["{app,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_runtime_dependency 'bootstrap-sass', '~> 3.3', '>= 3.3.4'
  spec.add_runtime_dependency 'sass-rails', '~> 3.2'
  spec.add_runtime_dependency 'font-awesome-rails', '~> 4.3', '>= 4.3.0.0'
  spec.add_runtime_dependency 'redcarpet', '~> 3.2', '>= 3.2.3'
  spec.add_runtime_dependency 'pygments.rb', '~> 0.6', '>= 0.6.3'

  spec.required_ruby_version = '>= 1.9.3'
end
