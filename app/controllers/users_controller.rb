class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :new, :create, :activate, :show]

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

  def solutions
    @user = User.find(params[:id])
    @solutions = Solution.where(:user_id => @user.id).paginate(:page => params[:page], :per_page => 6)
  end

  def ideas
    @user = User.find(params[:id])
    @ideas = Idea.where(:user_id => @user.id).paginate(:page => params[:page], :per_page => 6)
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
      redirect_to :root, :notice => 'User was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])
    # raise params[:user][:avatar].inspect

      if @user.update_attributes(params[:user])
        redirect_to @user, :notice => 'User was successfully updated.'
      else
        render :action => "edit"
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
