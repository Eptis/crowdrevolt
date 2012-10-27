class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]

  def new
  end

  def create
    # raise params[:user].inspect
      if @user = login(params[:username], params[:password], params[:remember])
        # redirect_back_or_to(:users, :notice => 'Login successful.')
        redirect_to :root
      else
        # render :root => "new"
        redirect_to :root

      end
  end

  def destroy
    logout
    redirect_to(:root, :notice => 'Logged out!')
  end
end
