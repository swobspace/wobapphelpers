require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  include Capybara::Minitest::Assertions

  setup do
    # Capybara.current_driver = Capybara.javascript_driver # :selenium by default
    Wobapphelpers.cancan = :none
  end

  teardown do
    Wobapphelpers.cancan = :none
  end

  test "posts#index page" do
    visit posts_path
    # print page.html
    # assert_selector(:xpath, '//a[href="/posts/new"]', count: 1)
    click_link "Posting erstellen"
    # save_and_open_screenshot
    fill_in "Betreff", with: "Lorem Ipsum tralala"
    fill_in "Inhalt", with: "To bee, or humblebee?"
    fill_in "Autor",  with: "Tomy Beth"
    fill_in "Datum", with: "12.12.2022"
    click_button "Posting erstellen"
    page.assert_text "Lorem Ipsum tralala"
    page.assert_text "To bee, or humblebee?"
    page.assert_text "Tomy Beth"
    page.assert_text "2022-12-12"
    click_button "Posting löschen"
    page.assert_text "Postings"
    page.has_link? "Posting erstellen"
  end

end
