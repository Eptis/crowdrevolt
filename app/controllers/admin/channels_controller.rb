class Admin::ChannelsController < AdminController
  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find(params[:id])
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(params[:channel])
    if @channel.save
      redirect_to([:admin, @channel], :flash => :success)
    else
      render("new")
    end
  end

  def edit
    @channel = Channel.find(params[:id])
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update_attributes(params[:channel])
      redirect_to([:admin, @channel])
    else
      render("edit")
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    redirect_to([:admin, :channels], :flash => :success)
  end
private

  def find_Channel
    @channel = Channel.find(params[:id])
  end
end
