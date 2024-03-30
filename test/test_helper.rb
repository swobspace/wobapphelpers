# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require 'capybara/rails'
require 'capybara/minitest'
require 'mocha/minitest'
require 'rails-controller-testing'
require 'selenium/webdriver'

Rails::Controller::Testing.install
Rails.backtrace_cleaner.remove_silencers!

# load locales from config/locales
Dir["#{File.dirname(__FILE__)}/../config/locales/**/*.yml"].each do |f|
  I18n.load_path << f
end

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

Capybara.register_driver :mychrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument("headless")
  options.add_argument("window-size=1280x1280")
  # options.add_argument("disable-gpu")

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    capabilities: [options]
  )
end

Capybara.javascript_driver = :mychrome

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  # include Capybara::Minitest::Assertions

  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

# For generators
require "rails/generators/test_case"
require "generators/wobapphelpers/install_generator"
require "cancancan"

class Ability
  include CanCan::Ability

  def initialize(user)
  end
end
