require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class SqrlOnRailsGenerator < ActiveRecord::Generators::Base
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      source_root File.expand_path("../templates", __FILE__)

      def copy_sqrl_migration
        if model_exists? || migration_exists?(table_name)
          migration_template "migration_existing.rb", "db/migrate/add_sqrl_to_#{table_name}.rb"
        else
          migration_template "migration.rb", "db/migrate/sqrl_create_#{table_name}.rb"
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
      t.string :suk, null: false
      t.string :vuk, null: false

      t.integer :sign_in_count, default: 0, null: false
      
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
RUBY
      end

      private

      def model_exists?
        File.exists?(File.join(destination_root, model_path))
      end

      def migration_exists?(table_name)
        Dir.glob("#{File.join(destination_root, migration_path)}/[0-9]*_*.rb").grep(/\d+_add_sqrl_to_#{table_name}.rb$/).first
      end

      def migration_path
        @migration_path ||= File.join("db", "migrate")
      end

      def model_path
        @model_path ||= File.join("app", "models", "#{file_path}.rb")
      end

      def model_contents
        buffer = <<-CONTENT
  # SQRL is usign this model. yay!
CONTENT
        buffer
      end
    end
  end
end