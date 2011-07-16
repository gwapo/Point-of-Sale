class CreateReceivings < ActiveRecord::Migration
  def self.up
    create_table :receivings do |t|
      t.integer :employee_id
      t.integer :supplier_id
      t.text :comment
      t.boolean :receive_type

      t.timestamps
    end
  end

  def self.down
    drop_table :receivings
  end
end

