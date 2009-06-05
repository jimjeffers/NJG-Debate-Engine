class Article < ActiveRecord::Base
  belongs_to :category, :counter_cache => true
  belongs_to :user, :counter_cache => true
  
  validates_presence_of :category_id, :message => "must be specified"
  validates_presence_of :user_id, :message => "must be specified"
  
  has_guid :title
  
  # Returns the name of the sport from the parent category.
  def sport
    category.sport.name
  end
  
end
