class AddAmountOnReceivingItems < ActiveRecord::Migration
  def self.up
      add_column :receiving_items, :amount, :decimal ,:default => 0
     # add_column :sales, :update_is, :boolean, :default => 0
  end

  def self.down
      remove_column :receiving_items, :amount
      #remove_column :sales, :update_is
  end
end

