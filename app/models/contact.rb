class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :message

  validates :email, :email => true
  validates_presence_of :name, :email, :message

  after_create :send_mail

  def send_mail
    ContactMailer.vraag(self).deliver
  end
end
