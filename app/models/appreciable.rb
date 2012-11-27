class Appreciable < ActiveRecord::Base
  attr_accessible :appreciated, :appreciable_id, :appreciable_type, :user_id
  belongs_to :user
  belongs_to :appreciable, :polymorphic => true
end
