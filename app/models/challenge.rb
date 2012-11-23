class Challenge < ActiveRecord::Base
  attr_accessible :title, :description
  has_many :solutions
  belongs_to :channel

  def to_param
    "#{id}-#{title}".parameterize
  end
end
