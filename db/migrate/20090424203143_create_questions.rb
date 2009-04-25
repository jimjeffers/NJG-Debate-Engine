class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.references :sport
      t.text :contents
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
