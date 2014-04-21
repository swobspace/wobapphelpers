require "test_helper"

class ViewTemplatesGeneratorTest < Rails::Generators::TestCase
  tests Wobapphelpers::Generators::ViewTemplatesGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "Assert all files are properly created" do
    run_generator
    ["show.html.erb", "edit.html.erb", "new.html.erb", 
      "index.html.erb", "_form.html.erb"].each do |file|
      assert_file "lib/templates/erb/scaffold/#{file}"
    end
  end
end
