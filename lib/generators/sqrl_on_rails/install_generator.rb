require 'rails/generators/base'

module SqrlOnRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc "Run this to setup SQRL! Everything will be explained later"

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

      def create_models
        generate 'model', 'SqrlOnRailsAuthentication --no-migration'
      end

      def include_env_config
        application(nil, env: :development) do <<-CONFIG
# SQRL Please define your site's domain and port
  config.sqrl_url_options = { host: 'localhost', port: 3000 }
CONFIG
        end

        application(nil, env: :production) do <<-CONFIG
# SQRL Please define your site's domain and port
  config.sqrl_url_options = { host: 'please.change.me', port: 443 }
CONFIG
        end
      end

      def show_readme
        readme "INSTALL_NOTICE" if behavior == :invoke
      end
    end
  end
end
