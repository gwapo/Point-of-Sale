class AddPolymorpicAssociationsInventories < ActiveRecord::Migration
  def self.up
      add_column :inventories, :resource_id, :integer
      add_column :inventories, :resource_type, :string
  end

  def self.down
      remove_column :inventories, :resource_id
      remove_column :inventories, :resource_type
  end
end

