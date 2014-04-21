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
end
