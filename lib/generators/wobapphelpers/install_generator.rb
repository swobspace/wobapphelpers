module Wobapphelpers
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      desc "Copy locale files to your application"

      def copy_locale
        ['en', 'de'].each do |lang|
          copy_file "../../../config/locales/#{lang}.yml", 
                    "config/locales/wobapphelpers.#{lang}.yml"
        end
      end

      def copy_layout
        copy_file "layouts/application.html.erb", "app/views/layouts/application.html.erb"
      end
    end
  end
end
