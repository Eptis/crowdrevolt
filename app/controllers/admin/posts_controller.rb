class Admin::PostsController < AdminController
  def index
    @posts = Post.all
  end

  def show
    # @post = Post.find(params[:id])
  end

  def new
    # @post = Post.new
  end

  def create
    # @post = Post.new(params[:post])
    if @post.save
      # redirect_to([:admin, @post], :flash => :success)
    else
      # render("new")
    end
  end

  def edit
    # @post = Post.find(params[:id])
    # raise @post.inspect
  end

  def update
    if @post.update_attributes(params[:post])
      # redirect_to([:admin, @post], :flash => :success)
    else
      # flash_now!(:error)
      # render("edit")
    end
  end

  def destroy
    # @post.destroy
    # redirect_to([:admin, :posts], :flash => :success)
  end

end
