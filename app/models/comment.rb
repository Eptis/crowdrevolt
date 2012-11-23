class Comment < ActiveRecord::Base
  attr_accessible :name, :body, :email, :user_id, :check
  attr_accessor :check

  belongs_to :user

  belongs_to :commentable, :polymorphic => true

  validate :comment_owner
  validate :check_field

  # validates_presence_of :name, :email

  def comment_owner
    unless user
      if name.blank?
        errors.add(:name, "Naam is verplicht")
      end
      if email.blank?
         errors.add(:email, "email is verplicht")
      end
    end
  end

  def check_field
    unless check.empty?
      errors.add(:check, "")
    end
  end
end
