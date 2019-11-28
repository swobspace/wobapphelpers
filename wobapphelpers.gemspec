$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wobapphelpers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wobapphelpers"
  s.version     = Wobapphelpers::VERSION
  s.authors     = ["Wolfgang Barth"]
  s.email       = ["wob@swobspace.de"]
  s.homepage    = "http://github.com/swobspace/wobapphelpers"
  s.summary     = "Rails helpers and more shared between wob's rails applications"
  s.description = "Rails helpers and more shared between wob's rails applications"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md", "rails/init.rb"]
  s.test_files    = Dir['test/**/*.rb']
  s.require_paths = ['lib']

  s.add_runtime_dependency 'sassc-rails'
  s.add_runtime_dependency "rails", ">= 5.0"
  s.add_runtime_dependency 'coffee-rails'
  s.add_runtime_dependency 'jquery-rails'
  s.add_runtime_dependency 'record_tag_helper', '~> 1.0'
  s.add_runtime_dependency 'font-awesome-sass', '>=4.7', '<= 6'
  s.add_runtime_dependency "responders"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "capybara"
  s.add_development_dependency "cancancan"
  s.add_development_dependency "shoulda-context"
  s.add_development_dependency "mocha"
  s.add_development_dependency 'simple_form'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-minitest"
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'puma'

end
