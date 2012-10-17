class AdminController < ActionController::Base
  before_filter :authorize_admin

private

  helper_method :current_admin
  def current_admin
    @current_admin ||= Admin.find_by_id(session[:admin_id]) if session[:admin_id]
  end

  def authorize_admin
    redirect_to :admin_login, :flash => { :error => flash_messages(:authorize_admin) } unless current_admin
  end

  def reset_params(param, key)
    params[param] ||= {}
    params[param][key] ||= []
  end

  def divided?(key)
    params[:divide].blank? || params[:divide] == key.to_s
  end
end