class LineItem < ActiveRecord::Base
  belongs_to :order  
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  def reduce_qty?
    qty = quantity - 1
    puts "Qty #{qty}"
    if qty == 0
      destroy
      return true      
    else
      update_attribute(:quantity , qty )      
      puts "qty #{quantity}"
    end
    return false
  end

end
