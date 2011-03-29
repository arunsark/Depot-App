class RemovePayTypeFromOrder < ActiveRecord::Migration
  def self.up
    remove_column :orders, :pay_type
  end

  def self.down
    add_column :orders, :pay_type, :string
  end
end
