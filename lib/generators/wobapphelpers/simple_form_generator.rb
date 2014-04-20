module Wobapphelpers
  module Generators
    class SimpleFormGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      desc "Copy simple_form templates to your application"

      def copy_scaffold_templates
        ["show", "edit", "new", "index", "_form"].each do |file|
          copy_file "erb/scaffold/#{file}.html.erb", "lib/templates/erb/scaffold/#{file}"
        end
      end
    end
  end
end
