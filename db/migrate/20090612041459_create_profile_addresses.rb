class CreateProfileAddresses < ActiveRecord::Migration
  def self.up
    create_table :profile_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street_1
      t.string :street_2
      t.string :city
      t.text :state
      t.string :zip, :length => 12
      t.string :country, :default => 'United States'
      t.references :user
      t.timestamps
    end
    add_index :profile_addresses, :user_id
  end

  def self.down
    remove_index :profile_addresses, :column_name
    drop_table :profile_addresses
  end
end
