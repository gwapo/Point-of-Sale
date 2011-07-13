class RemoveSaleDetailIdInSales < ActiveRecord::Migration
  def self.up
      remove_column :sales, :sale_detail_id
  end

  def self.down
      add_column :sales, :sale_detail_id
  end
end

