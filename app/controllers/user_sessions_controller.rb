class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :reset_session

  def new
    # @user = User.find(params[:id])
  end

  def create
    # raise params[:user].inspect
      if @user = login(params[:username], params[:password], params[:remember])
        redirect_back_or_to(:root, :notice => 'Login successful.')
      else
        # render :root => "new"
        redirect_to( :user_login, :alert => "Er is wat fout gegaan")

      end
  end

  def destroy
    logout
    redirect_to(request.referer, :notice => 'Logged out!')
  end

  private

    def reset_session
      reset_session
    end
end
