class SessionsController < ApplicationController

  def new
  end

  def create
    # user = User.find_by_email(params[:email])
    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to(request.referer)
    # else
    #   flash_now!(:error)
    #   render("new")
    # end
  end

  def destroy
    session[:user_id] = nil
    # session[:show_edit] = nil
    redirect_to(request.referer, :flash => :success)
  end
end
