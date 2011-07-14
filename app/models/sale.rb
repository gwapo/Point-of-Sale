class Sale < ActiveRecord::Base
    belongs_to :customer
    belongs_to :employee


    has_many :sale_items, :dependent => :destroy
    accepts_nested_attributes_for :sale_items

    after_create :add_item_id_to_inventory


    def add_item_id_to_inventory
      sale_items.each do |sale_item|
            i = Item.find(sale_item.item_id)
            if self.sales_type
                i.quantity -= sale_item.quantity_purchased.to_i
            else
                i.quantity += sale_item.quantity_purchased.to_i
            end
                i.save
             inventory = Inventory.new
             inventory.quantity = self.sales_type ? "-#{sale_item.quantity_purchased}" : "#{sale_item.quantity_purchased}"
             inventory.item_id = sale_item.item_id
             inventory.employee_id = 1
             inventory.comment = 'POS'
             inventory.amount = sale_item.item_unit_price
             inventory.save

      end

    end



end


# == Schema Information
#
# Table name: sales
#
#  id           :integer(4)      not null, primary key
#  customer_id  :integer(4)
#  employee_id  :integer(4)
#  comments     :text
#  payment_type :string(255)
#  amount       :integer(10)
#  created_at   :datetime
#  updated_at   :datetime
#

