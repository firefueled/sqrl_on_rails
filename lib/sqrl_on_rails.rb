require "sqrl_on_rails/engine"
require 'sqrl_on_rails/railtie' if defined?(Rails)

module SqrlOnRails

  mattr_accessor :mailer_sender
  @@mailer_sender = nil

  # Default way to setup Devise. Run rails generate devise_install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

end
