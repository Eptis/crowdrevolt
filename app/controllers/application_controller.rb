class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login, :except => :search
  before_filter :retrieve_channels


  helper_method :current_admin
  def current_admin
    @current_admin ||= Admin.find_by_id(session[:admin_id]) if session[:admin_id]
  end

  def search
    # unless params[:search] == ""
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
      # @searchresults.reverse!.sort_by(&:size)
      # raise @searchresults.inspect

      respond_to do |format|
        format.html
        format.js
      end
    # end
    # raise @results.inspect
  end

private
  def mobile_device?
    # raise request.env['HTTP_USER_AGENT'].inspect
    request.user_agent =~ /Mobile|webOS/
  end
  helper_method :mobile_device?

  def give_reward(object, *points)
    @reward = Reward.new
    @reward.user = current_user
    @reward.points = points.present? ? points : 1000
    @reward.rewardable_type = object.class.name
    @reward.rewardable_id = object.id
    @reward.save
    update_score(@reward.user)
  end
  helper_method :give_reward

  def update_score(user)
    @score = 0
    # reken idee en challenge punten uit
    user.rewards.each do |reward|
      @score += reward.points
    end

    #waarderingen optellen
    user.ideas.each do |idea|
      @score += idea.appreciables.count
    end

    user.solutions.each do |sol|
      @score += sol.appreciables.count
    end

    user.score = @score
    user.save
  end
  helper_method :update_score

  def all_texts
    @all_texts ||= Text.all
  end

  helper_method :text_values
  def text_values(key)
    text = all_texts.detect { |text| text.key == key.to_s }
    text ? text : Text.new
  end

  def construct_appreciable(construct)
    @record  = Appreciable.where(:appreciable_id => construct.id, :appreciable_type => construct.type).find_by_user_id([current_user].flatten)
    if @record
        @appreciable = @record
    else
      @appreciable = Appreciable.new
    end
  end




  private

  protected
  def not_authenticated
    redirect_to :user_login, :alert => "Voor deze pagina is een inlog vereist."
  end

  def signed_in
    return true if current_user
  end

  def retrieve_channels
    @channels = Channel.all

  end

end
