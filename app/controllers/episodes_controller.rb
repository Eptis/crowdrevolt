class EpisodesController < ApplicationController
  skip_before_filter :require_login
  before_filter :find_episode, :only => [:show, :edit, :update, :destroy]
  before_filter :find_channel

  def index
   @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
  end
private

  def find_episode
    @episode = Episode.find(params[:id])
  end

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end
end
