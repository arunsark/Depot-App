class AddPaymentTypeIdToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :payment_type_id, :integer
  end

  def self.down
    remove_column :orders, :payment_type_id
  end
end
