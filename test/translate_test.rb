require 'test_helper'

class TranslateTest < ActionView::TestCase
  test "translate cancel string" do
    assert_equal t('wobapphelpers.helpers.cancel'), "Abbrechen"
  end
end
