require 'test_helper'

class HelperDeliveryTest < ActionDispatch::IntegrationTest
  test "rendering icon" do
    get home_path
    assert_response :success
    ['pushpin', 'floppy-open', 'search'].each do |what|
      assert_match "<span class=\"glyphicon glyphicon-#{what}\"></span>", response.body
    end
  end
end
