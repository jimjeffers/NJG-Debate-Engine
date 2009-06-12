class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.datetime :paid_at
      t.integer :months
      t.references :order
      t.references :user
      t.timestamps
    end
    add_index :memberships, :order_id
    add_index :memberships, :user_id
  end

  def self.down
    remove_index :memberships, :user_id
    remove_index :memberships, :order_id
    drop_table :memberships
  end
end
