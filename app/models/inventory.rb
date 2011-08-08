class Inventory < ActiveRecord::Base
    #belongs_to :item
    belongs_to :employee
    belongs_to :resource, :polymorphic => true


end




# == Schema Information
#
# Table name: inventories
#
#  id            :integer(4)      not null, primary key
#  item_id       :integer(4)
#  employee_id   :integer(4)
#  comment       :string(255)
#  quantity      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  amount        :integer(10)     default(0)
#  resource_id   :integer(4)
#  resource_type :string(255)
#

