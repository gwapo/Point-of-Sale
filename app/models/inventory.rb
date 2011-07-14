class Inventory < ActiveRecord::Base
    #belongs_to :item
    belongs_to :employee

end


# == Schema Information
#
# Table name: inventories
#
#  id          :integer(4)      not null, primary key
#  item_id     :integer(4)
#  employee_id :integer(4)
#  comment     :string(255)
#  quantity    :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

