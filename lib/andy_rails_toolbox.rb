require 'andy_rails_toolbox/font-awesome-rails'
require 'andy_rails_toolbox/bootstrap-sass'

module AndyRailsToolbox
  class Engine < ::Rails::Engine
    initializer 'andy_rails_toolbox' do
      # include helpers path
      paths['app/helpers'] << 'app/helpers'
    end
  end
end
