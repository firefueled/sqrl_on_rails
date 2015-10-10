require 'rails/generators/active_record'
require 'generators/sqrl_on_rails/orm_helpers'

module ActiveRecord
  module Generators
    class SqrlOnRailsGenerator < ActiveRecord::Generators::Base
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      include SqrlOnRails::Generators::OrmHelpers
      source_root File.expand_path("../templates", __FILE__)

      def copy_sqrl_migration
        if model_exists? || migration_exists?(table_name)
          migration_template "user_migration_existing.rb", "db/migrate/add_sqrl_to_#{table_name}.rb"
        else
          migration_template "user_migration.rb", "db/migrate/create_sqrl_#{table_name}.rb"
        end
      end

      def generate_model
        invoke "active_record:model", [name], migration: false unless model_exists?
      end

      def inject_sqrl_content
        content = model_contents

        class_path = if namespaced?
          class_name.to_s.split("::")
        else
          [class_name]
        end

        indent_depth = class_path.size - 1
        content = content.split("\n").map { |line| "  " * indent_depth + line } .join("\n") << "\n"

        inject_into_class(model_path, class_path.last, content) if model_exists?
      end

      def migration_data
<<RUBY
      t.boolean :sqrlable, default:false, null: false

      t.string :suk
      t.string :vuk

      t.integer :sign_in_count, default: 0, null: false
      
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
RUBY
      end
    end
  end
end