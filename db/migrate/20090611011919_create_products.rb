class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :price
      t.integer :left_in_stock
      t.string :seo_title
      t.string :seo_description
      t.string :aasm_state, :default => 'hiding'
      t.string :type
      t.references :sport
      t.timestamps
    end
    add_index :products, :sport_id
  end

  def self.down
    remove_index :products, :sport_id
    drop_table :products
  end
end
