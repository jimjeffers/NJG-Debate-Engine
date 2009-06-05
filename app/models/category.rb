class Category < ActiveRecord::Base
  has_many :articles
  belongs_to :sport
  
  validates_uniqueness_of :name, :scope => :sport_id
  validates_presence_of :name
  validates_presence_of :sport
  
  has_guid :name
  
end
