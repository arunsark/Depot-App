class MigrateProductPriceToLineItems < ActiveRecord::Migration
  def self.up
    LineItem.find(:all).each do |lineitem|
      lineitem.update_attribute :price, lineitem.product.price
    end    
  end

  def self.down
    LineItem.find(:all).each do |lineitem|
      lineitem.update_attribute :price, nil
    end
  end
end
