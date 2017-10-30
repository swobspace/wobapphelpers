require 'test_helper'

class ActiveClassHelperTest < ActionView::TestCase
  include Wobapphelpers::Helpers::ActionViewHelper

  should "render new link" do
    assert_equal "active",  render(plain: active_class('test'))
  end
end
