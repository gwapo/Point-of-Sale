class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :payment_type
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
