class AddSeoInformationToCategoryArticleAndSport < ActiveRecord::Migration
  def self.up
    add_column :articles, :seo_title, :string
    add_column :categories, :seo_title, :string
    add_column :sports, :seo_title, :string
    add_column :articles, :seo_description, :string
    add_column :categories, :seo_description, :string
    add_column :sports, :seo_description, :string
  end

  def self.down
    remove_column :sports, :seo_description
    remove_column :categories, :seo_description
    remove_column :articles, :seo_description
    remove_column :sports, :seo_title
    remove_column :categories, :seo_title
    remove_column :articles, :seo_title
  end
end
