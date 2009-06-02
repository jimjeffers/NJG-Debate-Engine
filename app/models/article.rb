class Article < ActiveRecord::Base
  belongs_to :category, :counter_cache => true
  belongs_to :user, :counter_cache => true
  
  validates_presence_of :user_id, :on => :create, :message => "must be specified"
end
