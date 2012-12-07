class Admin::EpisodesController < AdminController
  before_filter :find_episode, :only => [:show, :edit, :update, :destroy]
  before_filter :find_channel
  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
    @questions = Question.where(:episode_id => @episode.id)
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(params[:episode])
    @episode.channel = @channel


    if @episode.save
      redirect_to([:admin, @channel], :flash => :success)
    else
      render("new")
    end
  end

  def edit
    @episode = Episode.find(params[:id])
  end

  def update
    @episode = Episode.find(params[:id])
    if @episode.update_attributes(params[:episode])
      redirect_to([:admin, @channel])
    else
      render("edit")
    end
  end

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
    redirect_to([:admin,  @channel], :flash => :success)
  end
private

  def find_episode
    @episode = Episode.find(params[:id])
  end

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end
end
