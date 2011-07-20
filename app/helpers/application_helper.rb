module ApplicationHelper

   def fullname(name)
       name.first_name + " " + name.last_name
   end

    def sub_total(cost_price, quantity )
        (cost_price.to_f * quantity.to_i )
    end

    def amount_total(cost_price, quantity, discount)
        sub_total(cost_price, quantity )
    end

end

