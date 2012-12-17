class ContactMailer < ActionMailer::Base
  default :from => "noreply@crowdrevolt.com"

  def vraag(contact)
    @contact = contact

    mail(:to => (Setting.by_key(:contact_question) || "dennistel90@gmail.com"), :subject => "Vraag van #{@contact.name}")

  end
end
