class Admin::ContactQuestionsController < AdminController
  

  def index
    @contact_questions = ContactQuestion.all
  end

  def new
    @contact_question = ContactQuestion.new
  end

  def create
    @contact_question = ContactQuestion.new(params[:contact_question])
    if @contact_question.save
      redirect_to([:admin, :contact_questions], :flash => :success)
    else
      flash_now!(:error)
      render(:new)
    end
  end
  
  def edit
    @contact_question = ContactQuestion.find(params[:id])
  end

  def update
    @contact_question = ContactQuestion.find(params[:id])
    if @contact_question.update_attributes(params[:contact_question])
      redirect_to([:admin, :contact_questions], :flash => :success)
    else
      render("edit")
    end
  end

  def destroy
    @contact_question = ContactQuestion.find(params[:id])
    @contact_question.destroy
    redirect_to([:admin,  :contact_questions], :flash => :success)
  end

end