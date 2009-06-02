class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  
  validates_presence_of :author_id, :on => :create, :message => "must be specified"
end
