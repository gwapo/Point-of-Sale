class CreateStoreConfigs < ActiveRecord::Migration
  def self.up
    create_table :store_configs do |t|
      t.string :company_name
      t.string :email
      t.string :fax
      t.string :phone
      t.string :website
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :store_configs
  end
end

