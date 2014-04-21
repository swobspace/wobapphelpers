require 'test_helper'

class FlashHelperTest < ActionController::TestCase
  tests PostsController

  test "shows flash messages within layout" do
    get :index
    assert_match "Always done", response.body
  end

end
