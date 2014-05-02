require 'test_helper'

class TranslateTest < ActionView::TestCase
  test "translate cancel string" do
    assert_equal t('wobapphelpers.helpers.cancel'), "Abbrechen"
  end
  test "translate generic controller action" do
    assert_equal t('wobapphelpers.controller.new', name: "Modell"), "Modell erstellen"
  end
end
