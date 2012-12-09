class Challenge < ActiveRecord::Base
  attr_accessible :title, :description, :channel_id
  has_many :solutions
  has_many :rewards, :as => :rewardable
  belongs_to :channel

  # Images select
  include ImageSelect
  image_select

  def to_param
    "#{id}-#{title}".parameterize
  end
end
