class AddReorderLevelToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :reorder_level, :integer
  end

  def self.down
    remove_column :items, :reorder_level, :integer
  end
end

