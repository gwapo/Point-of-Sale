class CreateSaleItems < ActiveRecord::Migration
  def self.up
    create_table :sale_items do |t|
      t.integer :sale_id
      t.integer :item_id
      t.decimal :quantity_purchased, :default => 0
      t.decimal :item_cost_price, :default => 0
      t.decimal :item_unit_price, :default => 0
      t.integer :discount_percent, :default => 0
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0

      t.timestamps
    end

    add_index :sale_items, :sale_id
    add_index :sale_items, :item_id


  end

  def self.down
    drop_table :sale_items
  end
end

