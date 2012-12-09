class ChannelsController < ApplicationController
  skip_before_filter :require_login
  def index
   @channels = Channel.all
   @recent = []
   @live = Episode.where("live = true").order('airdate asc').first
   @upcoming = Episode.where("airdate > ?", Time.now).first
   @posts = Post.order(&:updated_at)
   @solution = Solution.order(&:updated_at)
   @idea = Idea.order(&:updated_at)

   @recent << @posts << @solution << @idea
   @recent.flatten!
   @recent.sort! { |a,b| a.updated_at <=> b.updated_at }
   @recent.reverse!
   @recent = @recent[0..2]
  end

  def show
    @channel = Channel.find(params[:id])
    @live = Episode.where(:live => true, :channel_id => @channel.id).order('airdate asc').first
    @upcoming = Episode.where("airdate > ?", Time.now && :channel => @channel).first
    @posts = Post.find(:all, :limit => 3, :order => "updated_at DESC", :conditions => {:channel_id => @channel.id})
    @ideas = Idea.find(:all, :limit => 3, :order => "updated_at DESC", :conditions => {:channel_id => @channel.id})
    @episodes = Episode.find(:all, :limit => 3, :order => "airdate DESC", :conditions => {:channel_id => @channel.id})
  end
end
