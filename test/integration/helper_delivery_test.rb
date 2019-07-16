require 'test_helper'

class HelperDeliveryTest < ActionDispatch::IntegrationTest

  setup do
    Post.create!(subject: 'brabbel', body: 'Dies ist ein Test', user: 'wob', release: Date.today)
    Post.create!(subject: 'fasel', body: 'Dies ist ein zweiter Test', user: 'wob', release: Date.today)
  end

  test "rendering icon" do
    get home_path
    assert_response :success
    Wobapphelpers::Helpers::IconHelper::PREDEFINED_ICONS.each do |key,value|
      assert_match "<i class=\"fas fa-#{value} fa-fw\" aria-hidden=\"true\"></i>", response.body
    end
  end

  test "Post#index" do
    get posts_path
    assert_response :success
  end

  test "render new_link for all models" do
    get home_path
    assert_select "a[href=?]", "/posts/new", count: 2
    assert_select "a[href=?]", "/blogs/new", count: 1
  end
end
