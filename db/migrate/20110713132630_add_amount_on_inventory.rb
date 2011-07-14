class AddAmountOnInventory < ActiveRecord::Migration
  def self.up
      add_column :inventories, :amount, :decimal, :default => 0
  end

  def self.down
      remove_column :inventories, :amount, :decimal
  end
end

