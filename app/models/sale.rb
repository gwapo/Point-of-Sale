class Sale < ActiveRecord::Base
    belongs_to :customer
    belongs_to :employee

    has_many :sale_items, :dependent => :destroy
    accepts_nested_attributes_for :sale_items

end

