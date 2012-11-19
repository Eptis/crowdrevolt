class ChannelsController < ApplicationController
  skip_before_filter :require_login
  def index
   @channels = Channel.all
  end

  def show
    @channel = Channel.find(params[:id])
  end
end
