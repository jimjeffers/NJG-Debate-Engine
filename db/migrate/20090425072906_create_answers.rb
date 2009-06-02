class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.references :question
      t.references :user
      t.string :contents, :limit => 144
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
