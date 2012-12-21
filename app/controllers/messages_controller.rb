class MessagesController < ActionController::Base
  before_filter :find_channel
  before_filter :find_episode
  def index
    @messages = Message.all
  end

  def create
    # if @episode.live
      @message = Message.new(params[:message])
      if current_user
        @message.author_id = current_user.id
        @message.author_type = "User"
        @message.name = nil
        @message.email = nil
      # elsif !current_admin.nil
      #   @message.author_id = current_admin.id
      #   @message.author_type = "Admin"
      #   @message.name = nil
      #   @message.email = nil
      end

      if @channel && @episode
        @message.chattable_id = @episode.id
        @message.chattable_type = @episode.class.to_s
      else
        @message.chattable_id = @channel.id
        @message.chattable_type = @channel.class.to_s
      end

      if @message.chattable_type == "Episode"
        @fayechannel = @episode.id.to_s + @episode.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') + "/episode"
      else
        @fayechannel = @channel.id.to_s + @channel.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') + "/channel"
      end
      @message.save
      if @message.save
        respond_to do |format|
          format.js
        end
      end
    # end
  end

private
  def find_channel
    @channel = Channel.find(params[:channel_id])
  end

  def find_episode
    if params[:episode_id].present?
      @episode = Episode.find(params[:episode_id])
    end
  end
end