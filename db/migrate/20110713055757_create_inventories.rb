class CreateInventories < ActiveRecord::Migration
  def self.up
    create_table :inventories do |t|
      t.integer :item_id
      t.integer :employee_id
      t.string :comment
      t.string :quantity

      t.timestamps
    end

    add_index :inventories, :item_id
    add_index :inventories, :employee_id


  end

  def self.down
    drop_table :inventories
  end
end

