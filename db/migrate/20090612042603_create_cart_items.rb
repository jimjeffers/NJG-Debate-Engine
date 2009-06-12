class CreateCartItems < ActiveRecord::Migration
  def self.up
    create_table :cart_items do |t|
      t.references :cart
      t.references :product
      t.integer :quantity
      t.timestamps
    end
    add_index :cart_items, :cart_id
    add_index :cart_items, :product_id
  end

  def self.down
    remove_index :cart_items, :product_id
    remove_index :cart_items, :cart_id
    drop_table :cart_items
  end
end
