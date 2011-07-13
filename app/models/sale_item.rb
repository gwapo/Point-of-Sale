class SaleItem < ActiveRecord::Base
    belongs_to :sale
end


# == Schema Information
#
# Table name: sale_items
#
#  id                 :integer(4)      not null, primary key
#  sale_id            :integer(4)
#  item_id            :integer(4)
#  quantity_purchased :integer(4)
#  item_cost_price    :integer(10)
#  item_unit_price    :integer(10)
#  discount_percent   :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#

