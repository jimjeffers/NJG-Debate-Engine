require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Answer do
  before(:each) do
    @valid_attributes = {
      :question_id => 1,
      :user_id => 1,
      :contents => 'I think it is a test.'
    }
  end

  it "should create a new instance given valid attributes" do
    Answer.create!(@valid_attributes)
  end
  
  it "should not save if the user has already answered this question before" do
    answer1 = Answer.new(@valid_attributes).save
    answer2 = Answer.new(@valid_attributes).save
    answer1.should be(true)
    answer2.should be(false)
  end
  
  it "should not save unless a user and question are provided" do
    answer = Answer.new(:contents => 'Not enough meta information!').save
    answer.should be(false)
  end
  
end
