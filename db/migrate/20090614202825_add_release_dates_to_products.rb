class AddReleaseDatesToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :release_date, :datetime
  end

  def self.down
    remove_column :products, :release_date
  end
end
