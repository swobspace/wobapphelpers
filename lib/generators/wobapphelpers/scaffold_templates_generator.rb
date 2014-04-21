module Wobapphelpers
  module Generators
    class ScaffoldTemplatesGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      desc "Copy simple_form templates to your application"

      def copy_view_templates
        ["show.html.erb", "edit.html.erb", "new.html.erb", "index.html.erb", "_form.html.erb"].each do |file|
          copy_file "erb/scaffold/#{file}", "lib/templates/erb/scaffold/#{file}"
        end
      end

      def copy_controlle_template
          copy_file "rails/scaffold_controller/controller.rb", 
                    "lib/templates/rails/scaffold_controller/controller.rb"
      end
    end
  end
end
