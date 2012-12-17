class Admin::TextsController < AdminController
  def index
    @texts = Text.all
  end

  def edit
    @text = Text.find(params[:id])
  end

  def update
    @text = Text.find(params[:id])
    if @text.update_attributes(params[:text])
      redirect_to([:admin, :texts])
    else
      render(:edit)
    end
  end
end