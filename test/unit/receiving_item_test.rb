require 'test_helper'

class ReceivingItemTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: receiving_items
#
#  id           :integer(4)      not null, primary key
#  receiving_id :integer(4)
#  item_id      :integer(4)
#  description  :text
#  quantity     :integer(4)
#  cost_price   :integer(10)
#  unit_price   :integer(10)
#  discount     :integer(4)      default(0)
#  created_at   :datetime
#  updated_at   :datetime
#
