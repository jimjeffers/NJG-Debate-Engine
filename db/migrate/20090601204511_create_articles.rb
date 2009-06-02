class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title, :limit => 255
      t.text :excerpt
      t.text :content
      t.boolean :pro
      t.string :state
      t.string :guid
      t.string :revision_of
      t.datetime :published_on
      t.integer :comment_count, :limit => 4
      t.references :user
      t.references :category
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
