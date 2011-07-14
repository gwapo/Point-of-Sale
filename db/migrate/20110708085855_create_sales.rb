class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :customer_id
      t.integer :employee_id
      t.text :comments
      t.integer :sale_detail_id
      t.string :payment_type
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :sales
  end
end

