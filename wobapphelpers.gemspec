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

  s.add_dependency "responders"
  s.add_development_dependency "rails", "~> 4.1.0"
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency "bootstrap-sass"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "capybara"
  s.add_development_dependency "cancancan", '~> 1.7'
  s.add_development_dependency "shoulda-context"
  s.add_development_dependency "mocha"
  # -- see Gemfile until version 3.1 is released
  # s.add_development_dependency 'simple_form', '>= 3.1'
end
