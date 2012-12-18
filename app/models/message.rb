class Message < ActiveRecord::Base
  attr_accessible :content, :user_id, :name, :email
  belongs_to :chattable
  belongs_to :author, :polymorphic => true
end
