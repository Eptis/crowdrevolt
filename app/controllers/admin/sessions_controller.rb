class Admin::SessionsController < AdminController
  skip_before_filter :authorize_admin, :except => :destroy
  def new
  end

  def create
    admin = Admin.find_by_username(params[:username])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to([:admin, :root], :flash => :success)
    else
      flash_now!(:error)
      render("new")
    end
  end

  def destroy
    session[:admin_id] = nil
    session[:show_edit] = nil
    redirect_to([:admin, :login], :flash => :success)
  end
end