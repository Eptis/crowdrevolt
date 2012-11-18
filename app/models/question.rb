class Question < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :episode
end
