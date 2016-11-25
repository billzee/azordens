require 'test_helper'

class BrandTest < ActiveSupport::TestCase

  test "CT_003" do
    brand = Brand.find_by(id: 1)
    brand.update(visible: false)

    assert_not brand.visible
  end
end
