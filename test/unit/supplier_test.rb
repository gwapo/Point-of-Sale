require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: suppliers
#
#  id           :integer(4)      not null, primary key
#  company_name :string(255)
#  first_name   :string(255)
#  middle_name  :string(255)
#  last_name    :string(255)
#  email        :string(255)
#  phone_number :string(255)
#  address      :string(255)
#  comments     :text
#  created_at   :datetime
#  updated_at   :datetime
#

