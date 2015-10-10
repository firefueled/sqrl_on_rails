require 'rails/generators/named_base'

module SqrlOnRails
  module Generators
    class SqrlOnRailsGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace "sqrl_on_rails"
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a model with the given NAME (if one does not exist) with SQRL " <<
           "configuration plus a migration file and SQRL routes."

      hook_for :orm

      # class_option :routes, desc: "Generate routes", type: :boolean, default: true

      # def add_sqrl_routes
      #   sqrl_route  = "sqrl_for :#{plural_name}"
      #   sqrl_route << %Q(, class_name: "#{class_name}") if class_name.include?("::")
      #   sqrl_route << %Q(, skip: :all) unless options.routes?
      #   route sqrl_route
      # end
    end
  end
end
