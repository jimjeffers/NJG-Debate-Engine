class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name, :limit => 75
      t.references :sport
      t.timestamps
    end
    add_index :categories, :sport_id
  end

  def self.down
    remove_index :categories, :sport_id
    drop_table :categories
  end
end
