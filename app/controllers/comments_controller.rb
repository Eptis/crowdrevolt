class CommentsController < ApplicationController
  skip_before_filter :require_login
  before_filter :find_channel


  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user

    current_post.comments << @comment

    if @current_post.class == Post || @current_post.class == Idea
      @redirect = [@channel, @current_post]
    elsif @current_post.class == Solution
      @redirect = [@channel, @current_post.challenge, @current_post]
    end


    if @comment.save
      redirect_to(@redirect, :notice => "Comment has been created.")
    else
      redirect_to(@redirect, :alert => "Niet alle velden waren correct ingevuld")
      # vragen aan robin
    end
  end


  private
    def current_post

      if params[:post_id]
        @current_post ||= Post.find(params[:post_id])
      elsif params[:idea_id]
        @current_post ||= Idea.find(params[:idea_id])
      elsif params[:solution_id]
        @current_post ||= Solution.find(params[:solution_id])
      end
    end


    def find_channel
      @channel = Channel.find(params[:channel_id])
    end
end
