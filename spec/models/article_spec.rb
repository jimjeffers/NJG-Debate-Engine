require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Article do
  before(:each) do
    @valid_attributes = {
      :title => "Demo",
      :excerpt => "Test",
      :content => "Something",
      :category_id => 100,
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Article.create!(@valid_attributes)
  end
  
  describe "sport" do
    before(:each) do
      @sport = Sport.create!(:name => "Football")
      @category = Category.create!(:name => "Something", :sport_id => @sport.id)
      @article = Article.create!(@valid_attributes)
    end
    
    it "should return nil if no sport was found" do
      @article.sport.should be(nil)
    end
    
    it "should return the name of the sport" do
      @category.articles << @article
      @article.sport.should match(/Football/)
    end
  end
  
  describe "publish_date" do
    before(:each) do
      @sport = Sport.create!(:name => "Football")
      @category = Category.create!(:name => "Something", :sport_id => @sport.id)
      @article = Article.create!(@valid_attributes)
    end
    
    it "should be nil if it were never published" do
      @article.published_at.should be(nil)
    end
    
    it "should be the current datetime once published" do
      @article.submit!
      @article.publish!
      @article.published_at.day.should be(DateTime.now.day)
    end
    
    it "should be the current datetime once published" do
      @article.submit!
      @article.publish!
      @article.published_at.should_not be(nil)
    end
    
    it "should be unchanged if published subsequently after getting a date assigned" do
      @article.update_attribute(:published_at,1.day.ago)
      @article.submit!
      @article.publish!
      @article.published_at.day.should be(1.day.ago.day)
    end
  end
end
