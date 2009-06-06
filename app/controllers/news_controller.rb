class NewsController < ApplicationController
  layout 'site'
  before_filter :get_meta
  
  # Displays the main articles page.
  def index
    @articles = Article.chonologically.publicized
    @featured = Article.chonologically.featured
  end
  
  def article
    @article = Article.find_by_guid(params[:guid])
    @column = @article.category
    @sport = @column.sport
    @author = @article.user
  end
  
  def sport
    @sport = Sport.find_by_guid(params[:guid])
    @articles = Article.chonologically.for_sport(@sport).publicized
    @featured = Article.chonologically.for_sport(@sport).featured
  end
  
  def column
    @column = Category.find_by_guid(params[:guid])
    @articles = @column.articles.chonologically.publicized
    @featured = @column.articles.chonologically.featured
  end
  
  def author
    @author = User.find_by_login(params[:login])
    @articles = @author.articles.chonologically.publicized
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
