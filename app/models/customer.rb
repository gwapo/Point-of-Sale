class Customer < ActiveRecord::Base
    has_many :sales

    validates :country, :presence => true
end


# == Schema Information
#
# Table name: customers
#
#  id             :integer(4)      not null, primary key
#  first_name     :string(255)
#  last_name      :string(255)
#  phone_number   :string(255)
#  email          :string(255)
#  street_address :string(255)
#  city           :string(255)
#  state          :string(255)
#  country        :string(255)
#  comments       :text
#  created_at     :datetime
#  updated_at     :datetime
#

