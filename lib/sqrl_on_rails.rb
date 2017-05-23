require "sqrl_on_rails/engine"
require 'sqrl_on_rails/railtie' if defined?(Rails)

module SqrlOnRails

  # The Server Friendly Name
  mattr_accessor :sfn
  @@sfn = nil

  # Default way to setup Devise. Run rails generate devise_install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

end
