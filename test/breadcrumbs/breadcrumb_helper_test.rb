require 'test_helper'

class BreadcrumbHelperHelperTest < ActionDispatch::IntegrationTest
  setup do
    Post.create!(subject: 'brabbel', body: 'Dies ist ein Test', user: 'wob', release: Date.today)
    Post.create!(subject: 'fasel', body: 'Dies ist ein zweiter Test', user: 'wob', release: Date.today)
  end

  should "show breadcrumbs in posts#index" do
    get home_path
    get posts_path
    assert_select "div#breadcrumbs" do
      assert_select "[href='/home?bci=0']", title: "Home"
      assert_select "[href='/posts?bci=1']", title: "Postings"
    end
  end

  should "show back_link from breadcrumbs after some actions" do
    get home_path
    get posts_path
    # as long as :back is not used, the test should succeed 
    get home_path, headers: {'HTTP_REFERER' => 'http://example.org'}
    get posts_path
    assert_select "[class=?]", "btn btn-secondary" do
      assert_select "[href='/home?bci=2']", text: /.*Zurück/
    end
  end

  should "show back_link :back" do
    get home_path, headers: {'HTTP_REFERER' => 'http://example.org'}
    assert_select "[class=?]", "btn btn-secondary" do
      assert_select "[href='http://example.org']"
    end
  end
end
