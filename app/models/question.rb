class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :sport
  validates_presence_of :contents
end
