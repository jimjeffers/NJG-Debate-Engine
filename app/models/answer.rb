class Answer < ActiveRecord::Base
  belongs_to :question, :counter_cache => true
  belongs_to :user, :counter_cache => true
  
  validates_presence_of :contents
  validates_presence_of :question_id
  validates_presence_of :user_id
  validates_uniqueness_of :user_id, :scope => [:question_id]
  
  acts_as_debated
end
