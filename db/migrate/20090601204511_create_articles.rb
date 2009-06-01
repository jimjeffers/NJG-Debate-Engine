class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title, :length => 255
      t.text :excerpt
      t.text :content
      t.boolean :pro
      t.string :state
      t.string :guid
      t.string :revision_of
      t.integer :comment_count, :length => 4
      t.references :author
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
