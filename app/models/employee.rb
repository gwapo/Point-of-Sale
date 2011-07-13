class Employee < ActiveRecord::Base
    has_many :sales
end


# == Schema Information
#
# Table name: employees
#
#  id          :integer(4)      not null, primary key
#  first_name  :string(255)
#  middle_name :string(255)
#  last_name   :string(255)
#  email       :string(255)
#  address     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

