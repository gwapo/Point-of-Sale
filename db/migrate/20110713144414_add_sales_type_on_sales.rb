class AddSalesTypeOnSales < ActiveRecord::Migration
  def self.up
     add_column :sales, :sales_type, :boolean, :default => 0
  end

  def self.down
      remove_column :sales, :sales_type
  end
end

