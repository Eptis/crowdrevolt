class Admin::PostsController < AdminController
  before_filter :find_channel, :except => :index

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to([:admin, @post], :flash => :success)
    else
      render("new")
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to([:admin, @post])
    else
      render("edit")
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to([:admin, :posts], :flash => :success)
  end
private

  def find_post
    @post = Post.find(params[:id])
  end

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end
end
