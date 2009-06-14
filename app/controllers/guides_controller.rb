class GuidesController < ApplicationController
  layout 'admin'  
  before_filter :login_required
  require_role "products"
  
  # GET /guides
  # GET /guides.xml
  def index
    @guides = Guide.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @guides }
    end
  end

  # GET /guides/1
  # GET /guides/1.xml
  def show
    @guide = Guide.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @guide }
    end
  end

  # GET /guides/new
  # GET /guides/new.xml
  def new
    @guide = Guide.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @guide }
    end
  end

  # GET /guides/1/edit
  def edit
    @guide = Guide.find(params[:id])
  end

  # POST /guides
  # POST /guides.xml
  def create
    @guide = Guide.new(params[:guide])

    respond_to do |format|
      if @guide.save
        flash[:notice] = 'Guide was successfully created. You may now attach files.'
        format.html { redirect_to(edit_guide_path(@guide)) }
        format.xml  { render :xml => @guide, :status => :created, :location => @guide }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @guide.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /guides/1
  # PUT /guides/1.xml
  def update
    @guide = Guide.find(params[:id])

    respond_to do |format|
      if @guide.update_attributes(params[:guide])
        flash[:notice] = 'Guide was successfully updated.'
        format.html { redirect_to(@guide) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @guide.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1
  # DELETE /guides/1.xml
  def destroy
    @guide = Guide.find(params[:id])
    @guide.destroy

    respond_to do |format|
      format.html { redirect_to(guides_url) }
      format.xml  { head :ok }
    end
  end
end
