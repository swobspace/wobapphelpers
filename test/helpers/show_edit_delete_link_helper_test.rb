require 'test_helper'

class ShowEditDeleteLinkHelperTest < ActionView::TestCase
  include Wobapphelpers::Helpers::All

  setup do
    @post = Post.create(subject: 'bla', body: 'text')
  end

  test "new_link with options :class, :title and :remote" do
    render plain: new_link(Post, class: 'btn btn-small', 
                            title: 'Test title', remote: true)

    assert_select 'a[class=?][title=?][data-remote=?]', 
                  "btn btn-small", "Test title", "true"
  end

  test "show_link with options :class, :title and :remote" do
    render plain: show_link(@post, class: 'btn btn-small', 
                            title: 'Test title', remote: true)

    assert_select 'a[class=?][title=?][data-remote=?]', 
                  "btn btn-small", "Test title", "true"
  end

  test "edit_link with options :class, :title and :remote" do
    render plain: edit_link(@post, class: 'btn btn-small', 
                            title: 'Test title', remote: true)

    assert_select 'a[class=?][title=?][data-remote=?]', 
                  "btn btn-small", "Test title", "true"
  end

  test "delete_link with options :class, :title and :remote" do
    render plain: delete_link(@post, class: 'btn btn-small', 
                            title: 'Test title', remote: true)

    assert_select 'a[class=?][title=?][data-remote=?][data-method=?]', 
                  "btn btn-small", "Test title", "true", "delete"
  end



end
