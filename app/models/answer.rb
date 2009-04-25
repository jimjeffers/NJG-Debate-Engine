class Answer < ActiveRecord::Base
  validates_presence_of :contents
  validates_presence_of :question_id
  validates_presence_of :user_id
  validate_on_create :cannot_already_be_answered
  
  def cannot_already_be_answered
    errors.add_to_base("Cannot answer the same question twice") unless Answer.find_by_user_id_and_question_id(user_id,question_id).nil?
  end
end
