class AddGuidToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :guid, :string
  end

  def self.down
    remove_column :products, :guid
  end
end
