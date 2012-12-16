class IdeasController < ApplicationController
  skip_before_filter :require_login, :except => [:new, :edit, :create]
  before_filter :find_channel
  def index
    @ideas = Idea.where(:channel_id => @channel.id).paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = Comment.new
    construct_appreciable(@idea)
    @formrout = [@channel, @idea, @appreciable]
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(params[:idea])
    @idea.user = current_user
    @idea.channel = @channel
    if @idea.save
      redirect_to([@channel, @idea], :flash => :success)
    else
      render("new")
    end
    give_reward(@idea, 1)
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(params[:idea])
      redirect_to([@idea.channel, @idea])
    else
      render("edit")
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    update_score(@idea.user)
    @idea.destroy
    redirect_to([:ideas], :flash => :success)
  end
private

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end

end
