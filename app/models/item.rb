class Item < ActiveRecord::Base
    #has_many :inventories
    has_many :sales
    has_many :sale_items
    belongs_to :supplier

    after_create :add_item_id_to_inventory

    def add_item_id_to_inventory
             Inventory.create(
              :quantity => self.quantity,
              :item_id => self.id,
              :employee_id => 1,
              :comment => 'Add Item',
              :amount => self.cost_price
             )
     end


end


# == Schema Information
#
# Table name: items
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  category      :string(255)
#  supplier_id   :integer(4)
#  descriptions  :text
#  cost_price    :integer(10)
#  unit_cost     :integer(10)
#  quantity      :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#  reorder_level :integer(4)
#

