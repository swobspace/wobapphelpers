require 'test_helper'

class FormLegendTest < ActionController::TestCase
  tests PostsController

  setup do
    @p1 = Post.create!(subject: 'brabbel', body: 'Dies ist ein Test', user: 'wob', release: Date.today)
    @p2 = Post.create!(subject: 'fasel', body: 'Dies ist ein zweiter Test', user: 'wob', release: Date.today)
  end

  should "render group specific new form title" do
    get :new
    assert_select "div.row" do
      assert_select "div" do
        assert_select "legend", text: "Post/new"
      end
    end
  end

  should "render group specific update form title" do
    get :edit, id: @p1
    assert_select "div.row" do
      assert_select "div" do
        assert_select "legend", text: "Post/edit"
      end
    end
  end

end
