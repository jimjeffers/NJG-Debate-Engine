class Category < ActiveRecord::Base
  has_many :articles, :through => :categorizations
  belongs_to :sport
end
