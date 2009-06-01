class CreateCategorizations < ActiveRecord::Migration
  def self.up
    create_table :categorizations do |t|
      t.references :category
      t.references :article
      t.timestamps
    end
    add_index :categorizations, :category_id
    add_index :categorizations, :article_id
  end

  def self.down
    remove_index :categorizations, :article_id
    remove_index :categorizations, :category_id
    drop_table :categorizations
  end
end
