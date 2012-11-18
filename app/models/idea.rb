class Idea < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :channel

  def to_param
    "#{id}-#{title}".parameterize
  end
end
