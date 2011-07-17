require 'test_helper'

class ReceivingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: receivings
#
#  id           :integer(4)      not null, primary key
#  employee_id  :integer(4)
#  supplier_id  :integer(4)
#  comment      :text
#  receive_type :boolean(1)
#  created_at   :datetime
#  updated_at   :datetime
#

