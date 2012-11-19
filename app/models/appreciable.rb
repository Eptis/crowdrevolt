class Appreciable < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :appreciable, :polymorphic => true
end
