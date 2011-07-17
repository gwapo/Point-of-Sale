require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: inventories
#
#  id          :integer(4)      not null, primary key
#  item_id     :integer(4)
#  employee_id :integer(4)
#  comment     :string(255)
#  quantity    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  amount      :integer(10)     default(0)
#

