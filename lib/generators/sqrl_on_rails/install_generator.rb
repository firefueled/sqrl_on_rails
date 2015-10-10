require 'rails/generators/base'

module SqrlOnRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc "Creates a SQRL initializer and copy locale files to your application."
      class_option :orm

      def copy_initializer
        template "sqrl_on_rails.rb", "config/initializers/sqrl_on_rails.rb"
      end

      def copy_migration
        time = Time.now.utc.strftime "%Y%m%d%H%M%S"
        copy_file "migration.rb", "db/migrate/#{time}_create_sqrl_on_rails_authentications.rb"
      end

      def copy_locale
        copy_file "../../../config/locales/en.yml", "config/locales/sqrl_on_rails.en.yml"
      end

      def show_readme
        readme "INSTALL_NOTICE" if behavior == :invoke
      end
    end
  end
end
  