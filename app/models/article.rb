class Article < ActiveRecord::Base
  has_many :categories, :through => :categorizations
  belongs_to :user, :foreign_key => "author_id"
  
  validates_presence_of :author_id, :on => :create, :message => "must be specified"
end
