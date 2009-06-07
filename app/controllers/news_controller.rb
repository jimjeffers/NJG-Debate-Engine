class NewsController < ApplicationController
  layout 'site'
  before_filter :get_meta
  
  # Displays the main articles page.
  def index
    @articles = Article.chronologically.publicized
    @featured = Article.chronologically.featured
  end
  
  def article
    @article = Article.find_by_guid(params[:guid])
    @column = @article.category
    @sport = @column.sport
    @author = @article.user
  end
  
  def sport
    @sport = Sport.find_by_guid(params[:guid])
    @articles = Article.chronologically.for_sport(@sport).publicized
    @featured = Article.chronologically.for_sport(@sport).featured
  end
  
  def column
    @column = Category.find_by_guid(params[:guid])
    @articles = @column.articles.chronologically.publicized
    @featured = @column.articles.chronologically.featured
  end
  
  def author
    @author = User.find_by_login(params[:login])
    @articles = @author.articles.chronologically.publicized
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
