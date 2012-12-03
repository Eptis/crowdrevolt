class ChallengesController < ApplicationController
  skip_before_filter :require_login, :except => [:new, :edit, :create]
  before_filter :find_challenge, :only => [:show, :edit, :update, :destroy]
  before_filter :find_channel
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
    @comment = Comment.new
    @alternatives = Challenge.find(:all, :limit => 3, :conditions => {:id => !@challenge.id})
  end

private

  def find_challenge
    @challenge = Challenge.find(params[:id])
  end

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end
end
