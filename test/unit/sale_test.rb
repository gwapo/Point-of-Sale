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
#  amount       :decimal(8, 2)   default(0.0)
#  change       :decimal(8, 2)   default(0.0)
#  created_at   :datetime
#  updated_at   :datetime
#  sales_type   :boolean(1)      default(FALSE)
#  order        :boolean(1)      default(TRUE)
#

