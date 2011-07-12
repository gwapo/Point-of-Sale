class CreateSaleItems < ActiveRecord::Migration
  def self.up
    create_table :sale_items do |t|
      t.integer :sale_id
      t.integer :item_id
      t.integer :quantity_purchased
      t.decimal :item_cost_price
      t.decimal :item_unit_price
      t.integer :discount_percent

      t.timestamps
    end

    add_index :sale_items, :sale_id
    add_index :sale_items, :item_id
  end

  def self.down
    drop_table :sale_items
  end
end

