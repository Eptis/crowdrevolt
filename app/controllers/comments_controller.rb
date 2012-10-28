class CommentsController < ApplicationController
  skip_before_filter :require_login

  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    current_post.comments << @comment
    if @comment.save
      redirect_to(current_post, :notice => "Comment has been created.")
    else
      redirect_to(current_post, :alert => "Niet alle velden waren correct ingevuld")
      # vragen aan robin
    end
  end


  private
    def current_post
      @current_post ||= Post.find(params[:post_id])
    end
end
