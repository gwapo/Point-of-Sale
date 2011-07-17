require 'test_helper'

class SaleItemTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: sale_items
#
#  id                 :integer(4)      not null, primary key
#  sale_id            :integer(4)
#  item_id            :integer(4)
#  quantity_purchased :string(255)
#  item_cost_price    :integer(10)
#  item_unit_price    :integer(10)
#  discount_percent   :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#

