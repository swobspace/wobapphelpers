require 'test_helper'
require "wobapphelpers/responders.rb"

class FlashTest < ActionController::TestCase
  tests PostsController

  test "flash[notice] should be set with successful creation info" do
    post :create, params: { post: {subject: "Quark", body: "just a test"} }
    assert_equal "Posting erfolgreich erstellt.", flash[:notice]
  end

  test "flash[notice] should be set with successful update info" do
    post = Post.create!(subject: "Memo")
    put :update, params: { id: post.id, post: { body: "just a test"} }
    assert_equal "Posting erfolgreich aktualisiert.", flash[:notice]
  end

  test "flash[notice] should be set with successful deletion message" do
    post = Post.create!(subject: "Memo")
    delete :destroy, params: { id: post.id }
    assert_equal "Posting erfolgreich gelöscht.", flash[:notice]
  end
end
