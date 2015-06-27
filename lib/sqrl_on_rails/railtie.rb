require 'sqrl_on_rails/view_helpers'
module SqrlOnRails
  class Railtie < Rails::Railtie
    # inserting the view helpers
    initializer "sqrl_on_rails.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end

    # needed for getting the app's :root
    # initializer "Include your code in the controller" do
    # ActiveSupport.on_load(:action_controller) do
    #   include Sq
    # end

  end
end