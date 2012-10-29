class Reward < ActiveRecord::Base
  attr_accessible :user_id, :points, :rewardable_id, :rewardable_type

  belongs_to :user
  belongs_to :post
  belongs_to :rewardable, :polymorphic => true



end
