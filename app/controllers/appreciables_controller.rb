class AppreciablesController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :edit, :destroy, :update]
  before_filter :find_channel
  # before_filter :find_challenge
  before_filter :determine_appreciable
  before_filter :allowed, :only => [:create]



  # def new
  #   @appreciable = Appreciable.new
  # end

  def create
    # @appreciable = Appreciable.find(params[:appreciable])
    if @allowed.empty?
      @appreciable = Appreciable.new(params[:appreciable])
      @appreciable.user = current_user
      @appreciable.appreciable = @appreciated_appreciable
      if @appreciable.save
        # redirect_to(@rout, :flash => :success)
        if params[:solution_id]
          @formrout = [@channel, @challenge, @solution, @appreciable]
        elsif
          @formrout = [@channel, @idea, @appreciable]
        end
        # raise @formrout.inspect
         respond_to do |format|
          format.js
        end
      else
        redirect_to(@rout, :flash => :error)
      end
      update_score(@appreciated_appreciable.user)
    end
    # give_reward(@appreciable)
  end

  def update
    @appreciable = Appreciable.find(params[:id])
    @appreciable.destroy
    if params[:solution_id]
        @formrout = [@channel, @challenge, @solution, Appreciable.new]
    elsif
      @formrout = [@channel, @idea, Appreciable.new]
    end
     respond_to do |format|
      format.js
    end
    update_score(@appreciated_appreciable.user)
  end



private


  def find_channel
    @channel = Channel.find(params[:channel_id])
  end

  def find_solution
    @solution = Solution.find(params[:solution_id])
  end

  def determine_appreciable
    if params[:solution_id]
      @appreciated_appreciable = Solution.find(params[:solution_id])
      @solution = @appreciated_appreciable
      @challenge = Challenge.find(params[:challenge_id])
      @rout = [@channel, @challenge, @solution]
    elsif params[:idea_id]
      @appreciated_appreciable = Idea.find(params[:idea_id])
      @rout = [@channel, @challenge, @idea]
      @idea = @appreciated_appreciable
    end
  end

  def allowed
    @allowed = Appreciable.where(
      :appreciable_id => @appreciated_appreciable.id,
      :appreciable_type =>  @appreciated_appreciable.type.to_s,
      :user_id => current_user.id)
  end
end
