class AddGuidToCategoryAndSportAndQuestion < ActiveRecord::Migration
  def self.up
    add_column :sports, :guid, :string
    add_column :questions, :guid, :string
    add_column :categories, :guid, :string
  end

  def self.down
    remove_column :categories, :guid
    remove_column :questions, :guid
    remove_column :sports, :guid
  end
end
