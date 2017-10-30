require 'test_helper'
require 'sass'

class IconHelperTest < ActionView::TestCase
  include Wobapphelpers::Helpers::IconHelper

  test "icon() renders i with class fa" do
    render plain: icon('search')

    assert_select 'i.fa.fa-search.fa-fw', 1 
    assert_select 'i.fa.fa-quark', 0
  end

  Wobapphelpers::Helpers::IconHelper::PREDEFINED_ICONS.each do |key,value|
    test "icon_#{key} renders i with class fa-#{value}" do
      render plain: send("icon_#{key}")
 
      assert_select "i.fa.fa-#{value}", 1 
    end
  end
end
