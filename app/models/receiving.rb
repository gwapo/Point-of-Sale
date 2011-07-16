class Receiving < ActiveRecord::Base
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

