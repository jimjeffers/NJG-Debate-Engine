class UpdateArticlesForAasm < ActiveRecord::Migration
  def self.up
    rename_column :articles, :state, :aasm_state
  end

  def self.down
    rename_column :articles, :aasm_state, :state
  end
end
