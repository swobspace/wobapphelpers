require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  include Capybara::Minitest::Assertions

  setup do
    # Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  end

  test "posts#index page" do
    visit posts_path
    print page.html
    assert_selector(:xpath, './/a[href="/posts/new"]', count: 1)
    # click_link "Posting erstellen"
    save_and_open_screenshot
  end

end
