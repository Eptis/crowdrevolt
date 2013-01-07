class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]

  def new
    # @user = User.find(params[:id])
  end

  def create
    reset_session
    # raise params[:user].inspect
      if @user = login(params[:username], params[:password], params[:remember])
        # redirect_to(:back)
        redirect_back_or_to(:root, :notice => 'Je bent nu ingelogd.')
      else
        # render :root => "new"
        redirect_to( :user_login, :alert => "Er is wat fout gegaan")

      end
  end

  def destroy
    logout
    redirect_back_or_to(:root, :notice => 'Je bent nu uitgelogd.')
  end


end
