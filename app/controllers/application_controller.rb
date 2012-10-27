class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

private

  protected
  def not_authenticated
    redirect_to :user_login, :alert => "Please login first."
  end
end
