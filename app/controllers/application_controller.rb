class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  def give_reward(object, *points)
    @reward = Reward.new
    @reward.user = current_user
    @reward.points = points.present? ? points : 1000
    @reward.rewardable_type = object.class.name
    @reward.rewardable_id = object.id
    @reward.save
  end

  private

  protected
  def not_authenticated
    redirect_to :user_login, :alert => "Please login first."
  end

  def signed_in
    return true if current_user
  end


end
