class MessagesController < ActionController::Base
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(params[:message])
    respond_to do |format|
      format.js
    end
  end
end