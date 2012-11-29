class ChannelsController < ApplicationController
  skip_before_filter :require_login
  def index
   @channels = Channel.all
  end

  def show
    @channel = Channel.find(params[:id])
    @live = Episode.where("live = true").order('airdate asc').first
    @upcoming = Episode.where("airdate >= :today AND airdate <= :upcomingdate ", {:today => (Time.now), :upcomingdate => (Time.now + 2.day)}).order('airdate asc').first
  end
end
