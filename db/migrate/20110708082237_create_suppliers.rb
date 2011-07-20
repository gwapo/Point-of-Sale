class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :company_name
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :address
      t.text :comments

      t.timestamps
    end




  end

  def self.down
    drop_table :suppliers
  end
end

