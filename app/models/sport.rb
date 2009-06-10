class Sport < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :questions
  has_many :categories
  
  acts_as_taggable
  has_guid :name
  
  # Returns articles that belong to categories within the current sport.
  def articles
    Article.find(:all, :conditions => "category_id IN (#{category_ids})")
  end
  
  # return a string containing NULL to prevent MySQL errors from IN () which does
  # not throw a SQL error in sqlite.
  def category_ids
    (categories.length > 0) ? categories.map{|c| c.id}.join(', ') : 'NULL'
  end
  
end
