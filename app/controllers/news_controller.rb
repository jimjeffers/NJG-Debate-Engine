class NewsController < ApplicationController
  layout 'site'
  
  # Displays the main articles page.
  def index
    @articles = Article.find(:all)
  end
end
