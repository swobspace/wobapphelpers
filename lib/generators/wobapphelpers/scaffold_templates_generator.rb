module Wobapphelpers
  module Generators
    class ViewTemplatesGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      desc "Copy simple_form templates to your application"

      def copy_scaffold_templates
        ["show.html.erb", "edit.html.erb", "new.html.erb", "index.html.erb", "_form.html.erb"].each do |file|
          copy_file "erb/scaffold/#{file}", "lib/templates/erb/scaffold/#{file}"
        end
      end
    end
  end
end
