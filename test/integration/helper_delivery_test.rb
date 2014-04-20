require 'test_helper'

class HelperDeliveryTest < ActionDispatch::IntegrationTest
  test "rendering icon" do
    get home_path
    assert_response :success
    Wobapphelpers::Helpers::IconHelper::PREDEFINED_ICONS.each do |key,value|
      assert_match "<span class=\"glyphicon glyphicon-#{value}\"></span>", response.body
    end
  end

  test "using new_link for Post" do
    get posts_path
    assert_response :success
  end
end
