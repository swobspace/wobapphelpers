require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "icon renders span with class glyphicon" do
    render text: icon('search')

    assert_select 'span.glyphicon.glyphicon-search', 1 
    assert_select 'span.glyphicon.glyphicon-quark', 0
  end
end
