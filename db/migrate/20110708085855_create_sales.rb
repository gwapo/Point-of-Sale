class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :customer_id
      t.integer :employee_id
      t.text :comments
      t.integer :sale_detail_id
      t.string :payment_type
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0
      t.decimal :change, :precision => 8, :scale => 2, :default => 0
      t.timestamps
    end

    add_index :sales, :customer_id
    add_index :sales, :employee_id


  end

  def self.down
    drop_table :sales
  end
end

