require 'test_helper'
require 'sass'

class IconHelperTest < ActionView::TestCase
  include Wobapphelpers::Helpers::IconHelper

  test "icon() renders span with class glyphicon" do
    render text: icon('search')

    assert_select 'span.glyphicon.glyphicon-search', 1 
    assert_select 'span.glyphicon.glyphicon-quark', 0
  end

  Wobapphelpers::Helpers::IconHelper::PREDEFINED_ICONS.each do |key,value|
    test "icon_#{key} renders span with class glyphicon-#{value}" do
      render text: send("icon_#{key}")
 
      assert_select "span.glyphicon.glyphicon-#{value}", 1 
    end
  end
end
