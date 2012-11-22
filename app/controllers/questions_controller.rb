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

  def create
    @question = Question.new(params[:question])
    if current_user
      @question.user_id = current_user
      @question.name = nil
      @question.email = nil
    end
    @question.episode_id = @episode.id
    @fayechannel = @episode.id.to_s + @episode.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') + "/episode/questions/admin"
    @question.save
    respond_to do |format|
      format.js
    end
  end


private

  def find_episode
    @episode = Episode.find(params[:episode_id])
  end
end


