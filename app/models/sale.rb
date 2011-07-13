class Sale < ActiveRecord::Base
    belongs_to :customer
    belongs_to :employee


    has_many :sale_items, :dependent => :destroy
    accepts_nested_attributes_for :sale_items

    after_save :add_item_id_to_inventory

    def add_item_id_to_inventory
        sales_items = sale.sale_items
        inventory = sales_items.inventories
        invetory.quantity = 10
        inventory.save
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

