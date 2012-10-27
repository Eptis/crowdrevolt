class ImageRelation < ActiveRecord::Base
  # Relations
  belongs_to :image
  belongs_to :imageable, :polymorphic => true
end