class SolutionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :edit, :destroy, :update]
  before_filter :find_channel
  before_filter :find_challenge

  def index
   @solutions = Solution.all
  end

  def show
    @solution = Solution.find(params[:id])
    @comment = Comment.new
  end

  def new
    @solution = Solution.new
  end

  def create
    @solution = Solution.new(params[:solution])
    @solution.user = current_user
    @solution.challenge = challenge
    if @solution.save
      redirect_to([@channel, @challenge, @solution], :flash => :success)
    else
      render("new")
    end
    # give_reward(@solution)
  end

  def edit
    @solution = Solution.find(params[:id])
  end

  def update
    @solution = Solution.find(params[:id])
    if @solution.update_attributes(params[:solution])
      redirect_to([@solution])
    else
      render("edit")
    end
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy
    redirect_to([:posts], :flash => :success)
  end

private
  def find_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end
end
