require 'sqrl_on_rails/view_helpers'

module SqrlOnRails
  class Railtie < Rails::Railtie
    initializer "sqrl_on_rails.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end