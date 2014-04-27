require "test_helper"

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Wobapphelpers::Generators::InstallGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "Assert all files are properly created" do
    run_generator
    assert_file "config/locales/wobapphelpers.de.yml"
    assert_file "config/locales/wobapphelpers.en.yml"
  end

  test "Assert layout is copied" do
    run_generator
    assert_file "app/views/layouts/application.html.erb" do |layout|
      assert_match(/DOCTYPE html/, layout)
      assert_match(/navbar-brand/, layout)
      assert_match(/meta name="viewport"/, layout)
    end
  end

  test "Initializer is copied" do
    run_generator
    assert_file "config/initializers/wobapphelpers.rb" do |init|
      assert_match(/Wobapphelpers.setup/, init)
    end
  end
end
