class Receiving < ActiveRecord::Base
    belongs_to :supplier
    belongs_to :employee
    has_many :receiving_items, :dependent => :destroy
    accepts_nested_attributes_for :receiving_items





    after_create :add_item_id_to_inventory

private

    def add_item_id_to_inventory

      receiving_items.each do |item|
        item.discount ||= 0

        i = Item.find(item.item_id)
        if self.receive_type
            i.quantity += item.quantity.to_i
        else
            i.quantity -= item.quantity.to_i
        end
        i.save

        #update amount
         receiving_item = ReceivingItem.find(item)
         receiving_item.amount = totalamount( receiving_item.cost_price, receiving_item.quantity, receiving_item.discount )
         receiving_item.save

            Inventory.create :quantity => self.receive_type ? "#{ item.quantity}" : "-#{item.quantity}",
                :item_id => item.item_id,
                :employee_id => current_user.id,
                :comment => 'REC',
                :amount => item.cost_price,
                :resource => ReceivingItem.find(item.id)


      end#receiving_items.each do |item|

    end #eof add_item_id_to_inventory

    #def number_of_quantity
    #    @item_amount.inject(:+)
    #end #eof number_of_quantity
private

    def totalamount(unit_price = 0, quantity = 0, discount = 0)
           subamount( unit_price,quantity) - (subamount( unit_price,quantity)  * (discount.to_f/100))
    end#eof totalamount unit_price = 0, quantity = 0, discount = 0

    def subamount unit_price , quantity
        unit_price.to_f * quantity.to_i
    end #subamount unit_price , quantity

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

