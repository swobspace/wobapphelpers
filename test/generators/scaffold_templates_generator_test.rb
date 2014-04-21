require "test_helper"

class ScaffoldTemplatesGeneratorTest < Rails::Generators::TestCase
  tests Wobapphelpers::Generators::ScaffoldTemplatesGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "Assert all files are properly created" do
    run_generator
    ["show.html.erb", "edit.html.erb", "new.html.erb", 
      "index.html.erb", "_form.html.erb"].each do |file|
      assert_file "lib/templates/erb/scaffold/#{file}"
    end
    assert_file "lib/templates/rails/scaffold_controller/controller.rb"
  end
end
