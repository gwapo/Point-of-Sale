class Receiving < ActiveRecord::Base
    belongs_to :supplier
    belongs_to :employee
    has_many :receiving_items, :dependent => :destroy
    accepts_nested_attributes_for :receiving_items


    after_create :add_item_id_to_inventory

private

    def add_item_id_to_inventory
      receiving_items.each do |item|
        i = Item.find(item.item_id)
        if self.receive_type
            i.quantity += item.quantity.to_i
        else
            i.quantity -= item.quantity.to_i
        end
        i.save

            inventory = Inventory.new
            inventory.quantity = self.receive_type ? "#{ item.quantity}" : "-#{item.quantity}"
            inventory.item_id = item.item_id
            inventory.employee_id = 1
            inventory.comment = 'REC'
            inventory.amount = item.unit_price
            inventory.save

      end

    end

end


# == Schema Information
#
# Table name: receivings
#
#  id           :integer(4)      not null, primary key
#  employee_id  :integer(4)
#  supplier_id  :integer(4)
#  comment      :text
#  receive_type :boolean(1)
#  created_at   :datetime
#  updated_at   :datetime
#

