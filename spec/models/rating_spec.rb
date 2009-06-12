# require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
# 
# describe Rating do
#   before(:each) do
#     @valid_attributes = {
#       :user_id => 1,
#       :rateable_id => 1,
#       :value => 1
#     }
#   end
# 
#   it "should create a new instance given valid attributes" do
#     Rating.create!(@valid_attributes)
#   end
#   
#   it "should not create a new instance unless a rateable type and id and user are supplied" do
#     rating = Rating.new(:value => 1).save
#     rating.should be(false)
#   end
#   
#   it "should not create a new instance if a rating with the rateable_id/type and user_id exists" do
#     rating1 = Rating.new(@valid_attributes).save
#     rating2 = Rating.new(@valid_attributes).save
#     rating1.should be(true)
#     rating2.should be(false)
#   end
# end
