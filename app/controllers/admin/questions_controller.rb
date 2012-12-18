class Admin::QuestionsController < AdminController
  # before_filter :find_channel
  before_filter :find_episode
  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(params[:question])
    if current_user
      @question.user_id = current_user
      @question.name = nil
      @question.email = nil
    end

    @question.episode_id = @episode
    @question.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @question = Question.find(params[:id])
    @fayechannel = @episode.id.to_s + @episode.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') + "/episode/questions"
    if @question.update_attributes(params[:question])
      respond_to do |format|
        format.js
      end
    end
  end
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to [:admin, @episode.channel, @episode]
  end
private

  def find_episode
    if params[:episode_id].present?
      @episode = Episode.find(params[:episode_id])
    end
  end
end