class Admin::ChallengesController < AdminController
  before_filter :find_challenge, :only => [:show, :edit, :update, :destroy]
  before_filter :find_channel
  def index
    @challenges = Challenge.all
  end



  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(params[:challenge])
    @challenge.channel = @channel
    if @challenge.save
      redirect_to([:admin, @channel], :flash => :success)
    else
      render("new")
    end
    # give_reward(@challenge)
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update_attributes(params[:challenge])
      redirect_to([:admin, @channel])
    else
      render("edit")
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to([:challenges], :flash => :success)
  end
private

  def find_challenge
    @challenge = Challenge.find(params[:id])
  end

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end
end
