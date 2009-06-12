class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :ip
      t.string :error_message
      t.string :aasm_state, :default => 'pending'
      t.float :custom_payment_amount
      t.integer :amount
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
