require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: sales
#
#  id           :integer(4)      not null, primary key
#  customer_id  :integer(4)
#  employee_id  :integer(4)
#  comments     :text
#  payment_type :string(255)
#  amount       :integer(10)
#  created_at   :datetime
#  updated_at   :datetime
#  sales_type   :boolean(1)      default(FALSE)
#

