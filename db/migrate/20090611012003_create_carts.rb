class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      t.references :user
      t.references :order
      t.string :aasm_state, :default => 'pending'
      t.timestamps
    end
    add_index :carts, :order_id
    add_index :carts, :user_id
  end

  def self.down
    remove_index :carts, :order_id
    remove_index :carts, :user_id
    drop_table :carts
  end
end
