class Challenge < ActiveRecord::Base
  attr_accessible :title, :description, :channel_id, :active, :points

  #validatie
  validates_presence_of :title, :description, :points

  has_many :solutions
  has_many :rewards, :as => :rewardable
  belongs_to :channel

  def to_param
    "#{id}-#{title}".parameterize
  end
end
