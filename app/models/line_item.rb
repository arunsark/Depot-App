class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  def reduce_qty?
    qty = quantity - 1
    if qty == 0
      destroy
      return true      
    else
      update_attribute(:quantity , qty )      
    end
    return false
  end

end
