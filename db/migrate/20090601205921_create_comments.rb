class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :article
      t.string :author, :length => 125
      t.string :url
      t.string :ip, :length => 40
      t.string :email, :length => 75
      t.string :state, :length => 50
      t.text :content
      t.timestamps
    end
    add_index :comments, :article_id
  end

  def self.down
    remove_index :comments, :article_id
    drop_table :comments
  end
end
