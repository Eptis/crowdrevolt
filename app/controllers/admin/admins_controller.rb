class Admin::AdminsController < AdminController
  before_filter :find_admin, :only => [:edit, :update, :destroy]

  def index
    @search = Admin.search(params[:search])
    @admins = @search.page(params[:page])
    @admins = @admins.order("id DESC") if params[:search].blank?
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to([:admin, :admins], :flash => :success)
    else
      flash_now!(:error)
      render(:new)
    end
  end

  def edit
  end

  def update
    if @admin.update_attributes(params[:admin])
      redirect_to([:admin, :admins], :flash => :success)
    else
      flash_now!(:error)
      render(:edit)
    end
  end

  def destroy
    @admin.destroy
    redirect_to([:admin, :admins], :flash => :success)
  end

private

  def find_admin
    @admin = Admin.find(params[:id])
  end
end
