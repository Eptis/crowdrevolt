class ApplicationController < ActionController::Base
  protect_from_forgery

private

  helper_method :current_admin
  def current_admin
    @current_admin ||= Admin.find_by_id(session[:admin_id]) if session[:admin_id] && (session[:show_edit].nil? || session[:show_edit])
  end
end
