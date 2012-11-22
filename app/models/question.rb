class Question < ActiveRecord::Base
  attr_accessible :question, :user, :name, :email, :episode, :approved
  belongs_to :episode
  belongs_to :user
end
