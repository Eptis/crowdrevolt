class Admin::UsersController < AdminController
  def index
    @users = User.all
  end
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes

  #   end
  # end
end
