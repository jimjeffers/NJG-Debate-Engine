class Question < ActiveRecord::Base
  has_many :answers, :extend => ActiveRecord::Acts::Debated::OrderByScore
  belongs_to :sport, :counter_cache => true
  belongs_to :user, :counter_cache => true
  validates_presence_of :contents
  
  acts_as_taggable
  has_guid :name
end
