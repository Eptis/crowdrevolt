class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  before_filter :retrieve_channel

  def give_reward(object, *points)
    @reward = Reward.new
    @reward.user = current_user
    @reward.points = points.present? ? points : 1000
    @reward.rewardable_type = object.class.name
    @reward.rewardable_id = object.id
    @reward.save
  end


  def construct_appreciable(construct)
    @record  = Appreciable.where(:appreciable_id => construct.id, :appreciable_type => construct.type).find_by_user_id([current_user].flatten)
    if @record
        @appreciable = @record
    else
      @appreciable = Appreciable.new
    end
  end


  def search
    @search = Sunspot.search(Post, Channel, Episode, Idea, Solution) do
      fulltext params[:search] do
        highlight :title
        highlight :description
      end
    end
    @results = @search.results
    @searchresults = []
    @results_posts = []
    @results_channels = []
    @results_episodes = []
    @results_ideas = []
    @results_solutions = []


    @results.each do |result|
      if result.class == Post
        @results_posts << result
      elsif result.class == Channel
        @results_channels << result
      elsif result.class == Episode
        @results_episodes << result
      elsif result.class == Idea
        @results_ideas << result
      elsif result.class == Solution
        @results_solutions << result
      end
    end


    @searchresults = [@results_posts , @results_channels , @results_episodes , @results_ideas , @results_solutions]
    @searchresults.reverse!.sort_by(&:size)
    # raise @searchresults.inspect

    respond_to do |format|
      format.html
      format.js
    end
    # raise @results.inspect
  end

  private

  protected
  def not_authenticated
    redirect_to :user_login, :alert => "Please login first."
  end

  def signed_in
    return true if current_user
  end

  def retrieve_channel
    @channels = Channel.all
  end

end
