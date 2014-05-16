require 'test_helper'

class HelperDeliveryTest < ActionDispatch::IntegrationTest
  test "rendering icon" do
    get home_path
    assert_response :success
    Wobapphelpers::Helpers::IconHelper::PREDEFINED_ICONS.each do |key,value|
      assert_match "<span class=\"glyphicon glyphicon-#{value}\"></span>", response.body
    end
  end

  test "Post#index" do
    get posts_path
    assert_response :success
  end

  test "render new_link for all models" do
    get home_path
    assert_select "a[href=?]", "/posts/new", count: 1
    assert_select "a[href=?]", "/blogs/new", count: 1
  end
end
