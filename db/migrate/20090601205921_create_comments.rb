class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :article
      t.references :user
      t.string :author, :limit => 125
      t.string :url
      t.string :ip, :limit => 40
      t.string :email, :limit => 75
      t.string :state, :limit => 50
      t.text :content
      t.timestamps
    end
    add_index :comments, :article_id
    add_index :comments, :user_id
  end

  def self.down
    remove_index :comments, :user_id
    remove_index :comments, :article_id
    drop_table :comments
  end
end
