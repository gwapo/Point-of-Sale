class CreateSalesItems < ActiveRecord::Migration
  def self.up
    create_table :c do |t|
      t.integer :sale_id
      t.integer :item_id
      t.integer :quantity_purchased
      t.decimal :item_cost_price
      t.decimal :item_unit_price
      t.integer :discount_percent

      t.timestamps
    end

    add_index :item_sales, :sale_id
    add_index :item_sales, :item_id

  end

  def self.down
    drop_table :sales_items
  end
end

