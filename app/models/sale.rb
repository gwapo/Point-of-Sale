class Sale < ActiveRecord::Base
    belongs_to :customer
    belongs_to :employee

    has_many :sale_items, :dependent => :destroy
    accepts_nested_attributes_for :sale_items

    after_save :add_item_id_to_inventory

private

  def add_item_id_to_inventory

      if  self.order?

          sale_items.each do |item|

            i = Item.find(item.item_id)
            quantity_purchased =  item.quantity_purchased.to_i
            if self.sales_type
                i.quantity += quantity_purchased
            else
                i.quantity -= quantity_purchased
            end
            i.save

         #update amount
         sale_item = SaleItem.find(item)
         sale_item.amount = totalamount( sale_item.item_unit_price , sale_item.quantity_purchased , sale_item.discount_percent )
         sale_item.save

                Inventory.create :quantity =>  (self.sales_type ?  "-" : "") + item.quantity_purchased.to_s,
                                :item_id => item.item_id,
                                :employee_id => current_user.id,
                                :comment => 'POS',
                                :amount => item.item_unit_price,
                                :resource => SaleItem.find(item)
          end#receiving_items.each do |item|
      end #eof if  sale.order?

    end #eof add_item_id_to_inventory


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
# Table name: sales
#
#  id           :integer(4)      not null, primary key
#  customer_id  :integer(4)
#  employee_id  :integer(4)
#  comments     :text
#  payment_type :string(255)
#  amount       :decimal(8, 2)   default(0.0)
#  change       :decimal(8, 2)   default(0.0)
#  created_at   :datetime
#  updated_at   :datetime
#  sales_type   :boolean(1)      default(FALSE)
#  order        :boolean(1)      default(TRUE)
#

