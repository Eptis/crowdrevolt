class ContactsController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])
    @contact.save
    redirect_to :contact, :notice => "Je bericht is aangekomen, we zullen zo spoedig mogelijk reageren"
  end
end
