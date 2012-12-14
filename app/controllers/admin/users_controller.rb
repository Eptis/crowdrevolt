class Admin::UsersController < AdminController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # raise params[:user][:avatar].inspect

      if @user.update_attributes(params[:user])
        redirect_to [:admin, :users], :notice => 'User was successfully updated.'
      else
        render :action => "edit"
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to [:admin, :users], :notice => 'User was successfully deleted.'
  end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes

  #   end
  # end
end
