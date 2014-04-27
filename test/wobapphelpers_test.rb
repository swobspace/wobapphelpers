require 'test_helper'

class WobapphelpersTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Wobapphelpers
  end

  [:cancan1, :cancan2, :none].each do |variant|
    test "configure cancan to #{variant.to_s}" do
      Wobapphelpers.setup {|config| config.cancan = variant}
      assert_equal variant, Wobapphelpers::cancan
    end
  end

  test "configure raise error if cancan is invalid" do
    assert_raises RuntimeError do 
      Wobapphelpers.setup {|config| config.cancan = :invalid}
    end
  end
end
