class Question < ActiveRecord::Base
  has_many :answers, :extend => ActiveRecord::Acts::Debated::OrderByScore
  belongs_to :sport
  validates_presence_of :contents
end
