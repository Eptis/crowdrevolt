class PostsController < ApplicationController
  skip_before_filter :require_login, :except => [:new, :edit, :create]
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]
  before_filter :find_channel

  def index
    @posts = Post.where("published_at < ?", Time.now).where( :channel_id => @channel.id).paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      redirect_to([@post], :flash => :success)
    else
      render("new")
    end
    give_reward(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to([@post])
    else
      render("edit")
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to([:posts], :flash => :success)
  end
private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end
end
