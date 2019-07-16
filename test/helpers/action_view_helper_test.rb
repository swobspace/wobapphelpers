require 'test_helper'
require 'jquery-rails'
require 'shoulda-context'

class ActionViewHelperTest < ActionDispatch::IntegrationTest
  setup do
    Post.create!(subject: 'brabbel', body: 'Dies ist ein Test', user: 'wob', release: Date.today)
    Post.create!(subject: 'fasel', body: 'Dies ist ein zweiter Test', user: 'wob', release: Date.today)
  end

  context "without cancan" do
    should "show posts#index" do
      visit posts_path
      within('table tbody') do
	assert all(:xpath, '//a[contains(@class, "btn btn-secondary") and contains(@title, "Posting anzeigen")]').count == 2, 
	       "No show posting link found"
	assert all(:xpath, '//a[contains(@class,"btn btn-secondary") and contains(@title, "Posting bearbeiten")]').count == 2, 
	       "No edit posting link found"
	assert (all(:xpath, '//a[contains(@class,"btn btn-danger") and contains(@data-method, "delete") and contains(@title, "Posting löschen")]').length == 2), 
	       "No delete posting link found"
      end
      assert page.has_link?('Posting erstellen'), "no new post link found"
      assert find(:xpath, '//a[contains(@class, "btn btn-secondary") and contains(text(), "Posting erstellen")]'), 
	     "No new posting link found"
      assert page.has_link?('Zurück'), "No back button found"
      assert find(:xpath, '//a[contains(@class, "btn btn-secondary") and contains(text(), "Zurück")]'), 
	     "No back button found"
    end

    should "cancel_button renders i with class fa" do
      visit new_post_path
      assert page.has_text?('Post/new')
      within('form') do
	assert page.has_link?('Abbrechen'), "button submit not found"
	assert find('a.btn.btn-secondary i.fas.fa-trash'), 
	       "button cancel not found"
     end
    end
  end
end
