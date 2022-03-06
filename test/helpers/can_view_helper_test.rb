require 'test_helper'
require 'shoulda-context'

class CanViewHelperTest < ActionController::TestCase
  tests PostsController

  setup do
    @p1 = Post.create!(subject: 'brabbel', body: 'Dies ist ein Test', user: 'wob', release: Date.today)
    @p2 = Post.create!(subject: 'fasel', body: 'Dies ist ein zweiter Test', user: 'wob', release: Date.today)
    Wobapphelpers.cancan = :cancan1
    @ability = Object.new
    @ability.extend(::CanCan::Ability)
    @controller.stubs(:current_ability).returns(@ability)
  end

  teardown do
    Wobapphelpers.cancan = :none
  end


  context "with ability :create" do
    setup do
      @ability.can :create, Post
    end

    should "render new link" do
      get :index
      assert_select "a.btn.btn-secondary", { 
	href: "/posts/new", text: "Posting erstellen", count: 1 
      }
    end

    should "not render show link" do
      get :index
      assert_select "a.btn.btn-secondary" do
	assert_select "[href='/posts/#{assigns(:posts).first.id}']",  
                       title: "Posting anzeigen", count: 0
	assert_select "[href='/posts/#{assigns(:posts).last.id}']",  
                       title: "Posting anzeigen", count: 0
      end
    end

    should "not render edit link" do
      get :index
      assert_select "a.btn.btn-secondary" do
	assert_select "[href='/posts/#{assigns(:posts).first.id}/edit']",  
                       title: "Posting bearbeiten", count: 0
	assert_select "[href='/posts/#{assigns(:posts).last.id}/edit']",  
                       title: "Posting bearbeiten", count: 0
      end
    end
    should "not render delete link" do
      get :index
      assert_select "a.btn.btn-danger", title: "Posting löschen", count: 0
    end
  end

  context "with ability :read" do
    setup do
      @ability.can :read, Post
    end

    should "render show link" do
      get :index
      assert_select "a.btn.btn-secondary" do
	assert_select "[href='/posts/#{assigns(:posts).first.id}']",  
                       title: "Posting anzeigen"
	assert_select "[href='/posts/#{assigns(:posts).last.id}']",  
                       title: "Posting anzeigen"
      end
    end

    should "not render create link" do
      get :index
      assert_select "a.btn.btn-secondary", { 
	href: "/posts/new", text: "Posting erstellen", count: 0
      }
    end
    should "not render edit link" do
      get :index
      assert_select "a.btn.btn-secondary" do
	assert_select "[href='/posts/#{assigns(:posts).first.id}/edit']",  
                       title: "Posting bearbeiten", count: 0
	assert_select "[href='/posts/#{assigns(:posts).last.id}/edit']",  
                       title: "Posting bearbeiten", count: 0
      end
    end
    should "not render delete link" do
      get :index
      assert_select "a.btn.btn-danger", title: "Posting löschen", count: 0
    end
  end

  context "with ability :update" do
    setup do
      @ability.can :update, Post
    end

    should "not render show link" do
      get :index
      assert_select "a.btn.btn-secondary" do
	assert_select "[href='/posts/#{assigns(:posts).first.id}']",  
                       title: "Posting anzeigen", count: 0
	assert_select "[href='/posts/#{assigns(:posts).last.id}']",  
                       title: "Posting anzeigen", count: 0
      end
    end

    should "not render create link" do
      get :index
      assert_select "a.btn.btn-secondary", { 
	href: "/posts/new", text: "Posting erstellen", count: 0
      }
    end
    should "render edit link" do
      get :index
      assert_select "a.btn.btn-secondary" do
	assert_select "[href='/posts/#{assigns(:posts).first.id}/edit']",  
                       title: "Posting bearbeiten"
	assert_select "[href='/posts/#{assigns(:posts).last.id}/edit']",  
                       title: "Posting bearbeiten"
      end
    end
    should "not render delete link" do
      get :index
      assert_select "a.btn.btn-danger", title: "Posting löschen", count: 0
    end
  end

  context "with ability :read" do
    setup do
      @ability.can :destroy, Post
    end

    should "not render show link" do
      get :index
      assert_select "a.btn.btn-secondary" do
	assert_select "[href='/posts/#{assigns(:posts).first.id}']",  
                       title: "Posting anzeigen", count: 0
	assert_select "[href='/posts/#{assigns(:posts).last.id}']",  
                       title: "Posting anzeigen", count: 0
      end
    end

    should "not render create link" do
      get :index
      assert_select "a.btn.btn-secondary", { 
	href: "/posts/new", text: "Posting erstellen", count: 0
      }
    end
    should "not render edit link" do
      get :index
      assert_select "a.btn.btn-secondary" do
	assert_select "[href='/posts/#{assigns(:posts).first.id}/edit']",  
                       title: "Posting bearbeiten", count: 0
	assert_select "[href='/posts/#{assigns(:posts).last.id}/edit']",  
                       title: "Posting bearbeiten", count: 0
      end
    end
    should "render delete link" do
      get :index
      assert_select "a.btn.btn-danger" do
	assert_select "[href='/posts/#{assigns(:posts).first.id}']",  
                       title: "Posting bearbeiten", count: 1
	assert_select "[href='/posts/#{assigns(:posts).last.id}']",  
                       title: "Posting bearbeiten", count: 1
      end
    end
  end
end
