class ReceivingItem < ActiveRecord::Base
    belongs_to :receiving
    belongs_to :item
    has_one :inventory, :as => :resource, :dependent => :destroy

    validates :item_id, :presence => true
    attr_accessor :name


end



# == Schema Information
#
# Table name: receiving_items
#
#  id           :integer(4)      not null, primary key
#  receiving_id :integer(4)
#  item_id      :integer(4)
#  quantity     :integer(4)
#  cost_price   :integer(10)
#  discount     :integer(4)      default(0)
#  created_at   :datetime
#  updated_at   :datetime
#  amount       :integer(10)     default(0)
#

