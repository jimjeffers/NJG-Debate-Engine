class UsersController < ApplicationController
  layout 'admin'
  before_filter :login_required, :only => [:index, :manage, :destroy, :edit, :update] 
  require_role "admin", :only => [:index, :manage, :destroy] 
  
  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session! unless current_user.has_role?(:admin)
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      if current_user.has_role?(:admin)
        redirect_to users_path
        flash[:notice] = "New User Created!"
      else
        redirect_back_or_default('/')
        flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
      end
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end
  
  def edit
    if (current_user.has_role?(:admin)) 
      @user = User.find(params[:id]) 
    else
      @user = current_user
    end
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { 
          if current_user.has_role?(:admin)
            redirect_to(users_path) 
          else
            redirect_to(edit_user_path(@user))
          end
        }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def manage
    
  end
  
  def destroy
    
  end
  
  def index
    @users = User.with_roles
  end
end
