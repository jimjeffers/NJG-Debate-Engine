class ArticlesController < ApplicationController
  layout 'admin'
  
  before_filter :login_required
  before_filter :categories, :only => [:new, :update, :create, :edit]
  
  require_role "author"
  
  # GET /articles
  # GET /articles.xml
  def index
    if current_user.has_role?(:editor)
      @published = Article.chronologically.published
      @featured = Article.chronologically.featured
      @submitted = Article.chronologically.submitted
      @drafted = Article.chronologically.drafted
    else
      @published = current_user.articles.chronologically.published
      @featured = current_user.articles.chronologically.featured
      @submitted = current_user.articles.chronologically.submitted
      @drafted = current_user.articles.chronologically.drafted
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @events = Article.events
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if current_user.articles << @article
        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to(@article) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(@article) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    unless Article::EDITOR_ONLY.include?(@article.aasm_state) && !current_user.has_role?(:editor)
      @article = Article.find(params[:id])
      @article.delete!
    else
      flash[:error] = 'You are not authorized to destroy this article.'
    end

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
  
  def set_status
    unless (Article::EDITOR_ONLY.include?(params[:state]) && !current_user.has_role?(:editor)) || !Article.events.include?(params[:state])
      article = Article.find(params[:id])
      article.send("#{params[:state]}!")
      flash[:notice] = 'Article was successfully '+params[:state]+'.'
    else
      flash[:error] = 'You cannot set articles as '+params[:state]+'.'
    end
    unless Article::EDITOR_ONLY.include?(article.aasm_state) && !current_user.has_role?(:editor)
      redirect_to edit_article_path(article)
    else
      redirect_to articles_path
    end
  end
  
  protected
  # Grabs all existing categories.
  def categories
    @categories = Category.all
  end
end
