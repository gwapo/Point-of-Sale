class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :category
      t.integer :supplier_id
      t.text :descriptions
      t.decimal :cost_price
      t.decimal :unit_cost
      t.integer :quantity

      t.timestamps
    end

    add_index :items, :supplier_id


  end

  def self.down
    drop_table :items
  end
end

