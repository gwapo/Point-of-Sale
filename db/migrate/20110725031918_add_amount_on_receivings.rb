class AddAmountOnReceivings < ActiveRecord::Migration
  def self.up
      add_column :receivings, :amount, :decimal ,:default => 0
  end

  def self.down
      remove_column :receivings, :amount
  end
end

