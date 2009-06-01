class Sport < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :questions
  has_many :categories
end
