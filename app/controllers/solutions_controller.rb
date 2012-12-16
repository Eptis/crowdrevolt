class SolutionsController < ApplicationController
  skip_before_filter :require_login, :except => [:new, :edit, :destroy, :update]
  before_filter :find_channel
  before_filter :find_challenge
  before_filter :find_solution, :only => [:edit, :update, :destroy]

  def index
   @solutions = Solution.all
  end

  def show
    @solution = Solution.find(params[:id])
    @comment = Comment.new

    construct_appreciable(@solution)
    @formrout = [@channel, @challenge, @solution, @appreciable]

  end

  def new
    @solution = Solution.new
  end

  def create
    @solution = Solution.new(params[:solution])
    @solution.user = current_user
    @solution.challenge = @challenge
    @solution.channel = @channel
    if @solution.save
      redirect_to([@channel, @challenge, @solution], :flash => :success)
    else
      render("new")
    end
    give_reward(@solution, @solution.challenge.points)
  end

  def edit
    # @solution = Solution.find(params[:id])
  end

  def update
    # raise params[:solution].inspect
    # @solution = Solution.find(@user_solution.id)
    if @solution.update_attributes(params[:solution])
      redirect_to([@solution.challenge.channel, @solution.challenge, @solution])
    else
      render("edit")
    end
  end

  def destroy
    # @solution = Solution.find(params[:id])
    if @solution
      @solution.destroy
      redirect_to([@challenge], :flash => :success)
    else
      redirect_to([@channel])
    end
  end

  def appreciate
    @appreciable = Appreciable.new(params[:appreciable])

  end

private
  def find_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end

  def find_solution
    @solution = current_user.solutions.find(params[:id])
  end
end
