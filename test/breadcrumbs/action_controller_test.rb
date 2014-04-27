require 'test_helper'
require 'shoulda-context'
require 'wobapphelpers/breadcrumbs'

class ActionControllerTest < ActionController::TestCase
  tests PostsController

  should "add breadcrumb only for #index" do
    get :index
    assert_not session[:breadcrumbs].nil?
    assert_equal 1, session[:breadcrumbs].size
    assert_match "Postings", session[:breadcrumbs].last[0]
    assert_match "/posts", session[:breadcrumbs].last[1]
  end

  should "add breadcrumb only for #show" do
    post(:create, post: {subject: 'just a dummy'})
    post_id = assigns(:post).to_param
    get :show, id: post_id
    assert_not session[:breadcrumbs].nil?
    assert_equal 1, session[:breadcrumbs].size
    assert_match "Posting(#{post_id}", session[:breadcrumbs].last[0]
    assert_match "/posts/#{post_id}", session[:breadcrumbs].last[1]
  end

  should "last breadcrumb get session data" do
    get :index
    assert_not session[:breadcrumbs].nil?
    assert_match "Postings", @controller.last_breadcrumb[0]
    assert_match "/posts", @controller.last_breadcrumb_url
  end

  should "add breadcrumbs for posts#index and posts#show" do
    get :index
    post(:create, post: {subject: 'just a dummy'})
    post_id = assigns(:post).to_param
    get :show, id: post_id
    assert_equal 2, session[:breadcrumbs].size
    assert_match "Postings", session[:breadcrumbs].first[0]
    assert_match "/posts", session[:breadcrumbs].first[1]
    assert_match "Posting(#{post_id}", session[:breadcrumbs].last[0]
    assert_match "/posts/#{post_id}", session[:breadcrumbs].last[1]
  end
end
