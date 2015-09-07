require 'rails/generators/base'

module SqrlOnRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "Creates a migration to adapt your Users table to the SQRL login process"

      def create_migrations

      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
  