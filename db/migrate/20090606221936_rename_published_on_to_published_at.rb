class RenamePublishedOnToPublishedAt < ActiveRecord::Migration
  def self.up
    rename_column :articles, :published_on, :published_at
  end

  def self.down
    rename_column :articles, :published_at, :published_on
  end
end
