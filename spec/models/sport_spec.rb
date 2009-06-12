require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sport do
  before(:each) do
    @valid_attributes = {
      :name => "Football"
    }
  end

  it "should create a new instance given valid attributes" do
    Sport.create!(@valid_attributes)
  end
  
  describe "articles" do
    before(:each) do
      @sport1 = Sport.create!(@valid_attributes)
      @sport2 = Sport.create!(:name => "Basketball")
      @category1 = Category.create!(:name => "Test 1", :sport_id => @sport1.id)
      @category2 = Category.create!(:name => "Test 2", :sport_id => @sport2.id)
      @article1 = Article.create!(:title => "Something", :user_id => 1, :category_id => @category1.id)
      @article2 = Article.create!(:title => "Something", :user_id => 1, :category_id => @category2.id)
    end
    
    it "should contain article1 if that belongs to a category for that sport" do
      @sport1.articles.include?(@article1).should be(true)
    end
    
    it "should not contain article2 if it's category for another sport" do
      @sport1.articles.include?(@article2).should be(false)
    end
    
    it "should contain article2 if the category belongs to the current sport" do
      @category2.update_attribute(:sport_id, @sport1.id)
      @sport1.articles.include?(@article2).should be(true)
    end
    
    it "should no longer contain article1 if the category belongs to another sport" do
      @category1.update_attribute(:sport_id, @sport2.id)
      @sport1.articles.include?(@article1).should be(false)
    end
    
    it "should contain 2 articles if both categories belong to the current sport" do
      @category2.update_attribute(:sport_id, @sport1.id)
      @sport1.articles.length.should equal(2)
    end
    
    it "should contain 1 article if only one of the categories belong to the current sport" do
      @sport1.articles.length.should equal(1)
    end
  end
end
