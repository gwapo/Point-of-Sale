class Item < ActiveRecord::Base
    #has_many :inventories
    has_many :sales
    has_many :sale_items
    belongs_to :supplier
    has_one :inventory, :as => :resource, :dependent => :destroy

    #server side validations
    validates :name, :presence => true
    validates :category, :presence => true
    validates :cost_price, :presence => true
    validates :unit_cost, :presence => true
    validates :quantity, :presence => true
    validates :reorder_level, :presence => true


    after_create :add_item_id_to_inventory

    def add_item_id_to_inventory
             Inventory.create(
              :quantity => self.quantity,
              :item_id => self.id,
              :employee_id => 1,
              :comment => 'Add Item',
              :amount => self.cost_price,
              :resource => Item.find(self.id)
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

