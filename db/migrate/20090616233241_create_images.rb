class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.column :parent_id,  :integer
      t.column :content_type, :string
      t.string :attachable_type
      t.integer :attachable_id
      t.string :type
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
      t.timestamps
    end
    add_index :images, :parent_id
    add_index :images, :attachable_id
    add_index :images, :attachable_type
  end

  def self.down
    remove_index :images, :attachable_type
    remove_index :images, :attachable_id
    remove_index :images, :parent_id
    drop_table :images
  end
end
