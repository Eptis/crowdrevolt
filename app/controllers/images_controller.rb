class ImagesController < ActionController::Base
  before_filter :find_image, :only => [:edit, :update, :destroy]

  def index
    @images = Image.order("id DESC")
    @images = @images.search(:name_or_tag_taggings_tag_name_contains => params[:q]) if params[:q].present?
    @images = @images.page(params[:page]).per_page(params[:total].try(:to_i) || 40)
  end

  def new
    @image = Image.new
    respond_to do |format|
        format.js
        format.html { redirect_to([:new, @image], :flash => :success) }
      end
  end



  def create
    @image = Image.new(params[:image])
    if @image.extract_zip_or_save
      respond_to do |format|
        format.js
        format.html { redirect_to([:admin, :images], :flash => :success) }
      end
    else
      flash_now!(:error)
      render("new")
    end
  end

  def edit
    @image.thumbnail = params[:crop]
  end

  def update
    if @image.update_attributes(params[:image])
      redirect_to([:edit, :admin, @image], :flash => :success)
    else
      raise
      flash_now!(:error)
      render("edit")
    end
  end

  def destroy
    @image.destroy
    redirect_to([:admin, :images], :flash => :success)
  end

private

  def find_image
    @image = Image.find(params[:id])
  end
end
