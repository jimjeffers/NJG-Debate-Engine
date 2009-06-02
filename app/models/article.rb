class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  
  validates_presence_of :user_id, :on => :create, :message => "must be specified"
end
