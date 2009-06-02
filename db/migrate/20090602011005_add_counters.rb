class AddCounters < ActiveRecord::Migration
  def self.up
    rename_column :articles, :comment_count, :comments_count
    add_column :users, :comments_count, :integer, :limit => 10
    add_column :users, :articles_count, :integer, :limit => 10
    add_column :users, :questions_count, :integer, :limit => 10
    add_column :users, :picks_count, :integer, :limit => 10
    add_column :categories, :articles_count, :integer, :limit => 10
    add_column :sports, :questions_count, :integer, :limit => 10
    add_column :sports, :picks_count, :integer, :limit => 10
    add_column :questions, :user_id, :integer, :limit => 10
    add_column :questions, :answers_count, :integer, :limit => 10
    add_column :users, :answers_count, :integer, :limit => 10
    add_index :questions, :user_id
  end

  def self.down
    remove_column :users, :answers_count
    remove_column :questions, :answers_count
    remove_index :questions, :user_id
    remove_column :questions, :user_id
    remove_column :sports, :picks_count
    remove_column :sports, :questions_count
    remove_column :categories, :articles_count
    remove_column :users, :picks_count
    remove_column :users, :questions_count
    remove_column :users, :articles_count
    remove_column :users, :comments_count
    rename_column :articles, :comments_count, :comment_count
  end
end
