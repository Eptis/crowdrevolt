class PagesController < ApplicationController
  skip_before_filter :require_login

  def karma

  end

  def about

  end

  def contact
    @contact = Contact.new
  end
end
