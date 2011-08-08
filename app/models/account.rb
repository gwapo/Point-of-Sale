class Account < ActiveRecord::Base
    belongs_to :employee
end


# == Schema Information
#
# Table name: accounts
#
#  id           :integer(4)      not null, primary key
#  client_name  :string(255)
#  check_date   :datetime
#  amount       :integer(10)
#  created_at   :datetime
#  updated_at   :datetime
#  delivery_no  :string(255)
#  check_number :string(255)
#  bank_name    :string(255)
#  employee_id  :integer(4)
#

