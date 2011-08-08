class CreateReceivingItems < ActiveRecord::Migration
  def self.up
    create_table :receiving_items do |t|
      t.integer :receiving_id
      t.integer :item_id
      #t.text :description
      t.integer :quantity
      t.decimal :cost_price
      #t.decimal :unit_price
      t.integer :discount, :default => 0

      t.timestamps
    end

    add_index :receiving_items, :receiving_id
    add_index :receiving_items, :item_id

  end

  def self.down
    drop_table :receiving_items
  end
end

