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

      def copy_initializer
        copy_file "initializers/wobapphelpers.rb", "config/initializers/wobapphelpers.rb"
      end
    end
  end
end
