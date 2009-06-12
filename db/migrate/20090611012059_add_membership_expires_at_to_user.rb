class AddMembershipExpiresAtToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :membership_expires_at, :datetime
  end

  def self.down
    remove_column :users, :membership_expires_at
  end
end
