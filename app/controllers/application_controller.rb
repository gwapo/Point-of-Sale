class ApplicationController < ActionController::Base
  protect_from_forgery

protected

    def totalamount (unit_price,quantity,discount)
        unit_price * quantity
    end

end

