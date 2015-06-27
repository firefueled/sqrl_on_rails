require 'sqrl_on_rails/version'
require 'sqrl_on_rails/railtie' if defined?(Rails)

# Engaging the squirrel army...
module SqrlOnRails
  class Engine < ::Rails::Engine
  end

  class << self
  	attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :login_uri

    def initialize
      @login_uri = nil
    end
  end
end

# TODO Add integration with device and similar stuff
