require 'test_helper'

class IconHelperTest < ActionView::TestCase
  include Wobapphelpers::Helpers::IconHelper

  test "icon renders span with class glyphicon" do
    render text: icon('search')

    assert_select 'span.glyphicon.glyphicon-search', 1 
    assert_select 'span.glyphicon.glyphicon-quark', 0
  end
end
