class AddTransactionTypeOnSales < ActiveRecord::Migration
  def self.up
      add_column :sales, :order, :boolean, :default => 1

  end

  def self.down
      remove_column :sales, :order
  end
end

