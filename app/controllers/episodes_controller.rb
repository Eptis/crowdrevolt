class EpisodesController < ApplicationController
  skip_before_filter :require_login
  before_filter :find_episode, :only => [:show, :edit, :update, :destroy]
  before_filter :find_channel, :except => [:available]

  def index
   @episodes = Episode.where(:channel_id => @channel.id).paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @episode = Episode.find(params[:id])
    @message = Message.new
    @questions = Question.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def available
    @available = current_user
    respond_to do |format|
      # format.html
      format.js
    end

  end
private

  def find_episode
    @episode = Episode.find(params[:id])
  end

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end
end
