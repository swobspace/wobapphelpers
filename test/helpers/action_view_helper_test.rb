require 'test_helper'
require 'sass'

class ActionViewHelperTest < ActionDispatch::IntegrationTest
  fixtures :posts

  test "posts#index" do
    visit posts_path
    within('table tbody') do
      assert all(:xpath, '//a[contains(@class, "btn btn-default") and contains(@title, "Posting anzeigen")]').count == 2, 
             "No show posting link found"
      assert all(:xpath, '//a[contains(@class,"btn btn-default") and contains(@title, "Posting bearbeiten")]').count == 2, 
             "No edit posting link found"
      assert (all(:xpath, '//a[contains(@class,"btn btn-danger") and contains(@data-method, "delete") and contains(@title, "Posting löschen")]').length == 2), 
             "No delete posting link found"
    end
    assert find(:xpath, '//a[@class = "btn btn-default"]/text()', 'Posting erstellen'), 
           "No new posting link found"
  end

  test "cancel_button renders span with class glyphicon" do
    visit new_post_path
    assert page.has_text?('New post')
    within('form') do
      assert page.has_button?('submit'), "button submit not found"
      assert find('a.btn.btn-default span.glyphicon.glyphicon-remove'), 
             "button cancel not found"
      # assert find(:xpath, '//a[@class = "btn btn-default"]/text()', 'Abbrechen'), 
      # assert page.has_button?('cancel'), "button cancel not found"
      # assert page.has_button?('Cancel'), "button cancel not found"
      # assert page.has_button?('Abbrechen'), "button cancel not found"
   end
  end

end
