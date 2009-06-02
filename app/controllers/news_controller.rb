class NewsController < ApplicationController
  layout 'site'
  before_filter :get_meta
  
  # Displays the main articles page.
  def index
    @articles = Article.find(:all)
  end
  
  protected
  # Grabs all sports, categories, and authors.
  def get_meta
    @body_id = "articles"
    @sports = Sport.all
    @categories = Category.all
    @authors = User.authors
  end
end
