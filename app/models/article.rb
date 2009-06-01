class Article < ActiveRecord::Base
  has_many :categories, :through => :categorizations
  belongs_to :user
end
