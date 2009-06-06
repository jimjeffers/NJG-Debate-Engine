class NewsController < ApplicationController
  layout 'site'
  before_filter :get_meta
  
  # Displays the main articles page.
  def index
    @articles = Article.publicized
    @featured = Article.featured
  end
  
  def article
    @article = Article.find_by_guid(params[:guid])
    @column = @article.category
    @sport = @column.sport
    @author = @article.user
  end
  
  def sport
    @sport = Sport.find_by_guid(params[:guid])
    @articles = Article.for_sport(@sport).publicized
    @featured = Article.for_sport(@sport).featured
  end
  
  def column
    @column = Category.find_by_guid(params[:guid])
    @articles = @column.articles.publicized
    @featured = @column.articles.featured
  end
  
  def author
    @author = Author.find_by_login(params[:id])
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
