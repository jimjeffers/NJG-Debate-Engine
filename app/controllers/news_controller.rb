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
    get_seo(@article)
    
    unless @article.published? || @article.featured?
      if current_user
        redirect_to news_path unless current_user.has_role?(:author)
      else
        redirect_to news_path
      end
    end
  end
  
  def sport
    @sport = Sport.find_by_guid(params[:guid])
    @articles = Article.chronologically.for_sport(@sport).publicized
    @featured = Article.chronologically.for_sport(@sport).featured
    get_seo(@sport)
  end
  
  def column
    @column = Category.find_by_guid(params[:guid])
    @articles = @column.articles.chronologically.publicized
    @featured = @column.articles.chronologically.featured
    get_seo(@column)
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
  
  # Gets SEO information for the supplied object
  def get_seo(object)
    @page_title = object.seo_title
    @page_description = object.seo_description
    @page_keywords = object.tag_list
  end
end
