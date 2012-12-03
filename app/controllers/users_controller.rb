class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :new, :create, :activate]
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @solutions = Solution.find(:all, :limit => 3, :conditions => {:user_id => @user.id})
    @ideas = Idea.find(:all, :limit => 3, :conditions => {:user_id => @user.id})
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, :notice => 'User was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        redirect_to @user, :notice => 'User was successfully updated.'
        head :no_content
              else
        render :action => "edit"
        render :json => @user.errors, :status => :unprocessable_entity
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(:user_login, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end
end
