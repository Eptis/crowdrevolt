class QuestionsController < ApplicationController
  skip_before_filter :require_login
  before_filter :find_episode
  def index
    @questions = Question.where(:episode_id => @episode.id)
    # render :file => "questions/questions.json.erb", :content_type => 'application/json'
    respond_to do |format|
     format.json  { render :json => {:questions => @questions }}
    end
  end


private

  def find_episode
    @episode = Episode.find(params[:episode_id])
  end
end
